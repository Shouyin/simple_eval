#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "DFA.h"

int main(int argc, char *argv[]) {

    if(argc != 2) {
        printf("error: should have exactly 1 argument");
        return 1;
    }

    const char* dfa_filep = argv[1];
    dfa_t *dfa;
    dfa = read_dfa(dfa_filep);

    print_dfa(dfa);
    const char *inputs[] = {
        "abccccc",
        "abcmjhnbbvjkhvcc",
        "ab",
        "c",
        "ccba"
    };
    for(int i = 0; i < 5; i ++) {
        printf("%s, result %d\n", inputs[i], run_dfa(dfa, (char *)inputs[i], strlen(inputs[i])));
    }

    return 0;
}

int test_accept(dfa_t *dfa, int now_state) {
    return dfa->accept_state == now_state;
}

int run_dfa(dfa_t *dfa, char* input, int len) {
    int now_state = dfa->start_state;
    char c;
    for(int i = 0; i < len; i ++) {
        if(now_state != DEAD_STATE) {
            c = input[i];

            if((dfa->symbol_reverse_map)[c] != NO_MAP) {
                now_state = (dfa->table)[now_state][(dfa->symbol_reverse_map)[c]];
            } else {
                now_state = DEAD_STATE;
            }
        }
    }
    return now_state != DEAD_STATE && test_accept(dfa, now_state);
}

int **build_empty_table(int number_states, int number_symbols) {
    int **table = (int **)malloc(number_states * sizeof(int *));
    for(int i = 0; i < number_states; i ++) {
        table[i] = (int *)malloc(number_symbols * sizeof(int));
        for(int j = 0; j < number_symbols; j ++)
            table[i][j] = DEAD_STATE;
    }

    return table;
}

void print_dfa(dfa_t *dfa) {
    printf("nsymbols: %d, nstates: %d, start_state: %d, accept_state: %d\n", 
            dfa->symbols, dfa->state, dfa->start_state, dfa->accept_state);
    printf("from: | symbol->\t");
    for(int i = 0; i < dfa->symbols; i ++) printf("%8c\t", (dfa->symbol_map)[i]);
    printf("\n");
    for(int i = 0; i < dfa->state; i ++) {
        printf("%8d\t\t", i);
        for(int j = 0; j < dfa->symbols; j ++) {
            printf("%8d\t", (dfa->table)[i][j]);
        }
        printf("\n");
    }
}


dfa_t *read_dfa(const char* dfa_filep) {
    FILE *dfa_file;
    dfa_file = fopen(dfa_filep, "r");

    char line[ASCII_COUNT] = {0};
    char c;

    int number_states, start_state, accept_state;
    int number_symbols = 0;
    
    // first line: state counts
    // fgets skipped over \n
    fgets((char *) line, ASCII_COUNT, dfa_file);
    number_states = atoi(line);

    if(number_states > MAX_STATE) {
        printf("error: exceeded max state %d", MAX_STATE);
        fclose(dfa_file);
        return NULL;
    }

    dfa_t *dfa = (dfa_t*)malloc(sizeof(dfa_t));
    memset(dfa->symbol_reverse_map, NO_MAP, ASCII_COUNT);
    // dfa->symbol_reverse_map = {NO_MAP};
    
    // second line: symbols
    while((c = fgetc(dfa_file)) != '\n'){
        // store the symbol-index(in table) pair in the reverse map
        (dfa->symbol_reverse_map)[c] = number_symbols;
        (dfa->symbol_map)[number_symbols] = c;
        number_symbols++;
    }

    printf("number_states: %d,\nnumber_symbols: %d", number_states, number_symbols);


    // start state and accept state
    fgets((char *) line, ASCII_COUNT, dfa_file);
    start_state = atoi(line);

    // only one accept state for now
    fgets((char *) line, ASCII_COUNT, dfa_file);
    accept_state = atoi(line);

    // build table
    int **table = build_empty_table(number_states, number_symbols);

    dfa->table = table;
    dfa->state = number_states;
    dfa->symbols = number_symbols;
    dfa->start_state = start_state;
    dfa->accept_state = accept_state;

    char *tranc_from;
    char *tranc_end;
    int now_on = 0;
    int from_state, to_state, symbol;
    char tmp_state[8];
    while(fgets((char *) line, ASCII_COUNT, dfa_file) != NULL) {
        tranc_from = (char*)line;
        tranc_end = (char*)line;

        while(now_on < 3) {
            while(*tranc_end == ' ')
                tranc_end ++;
            tranc_from = tranc_end;
            // printf("end: %c\n",*tranc_end);
            if(now_on < 2) {
                while(*tranc_end != ',')
                    tranc_end ++;
            } else {
                while(*tranc_end != '\n' && *tranc_end != '\0')
                    tranc_end ++;
            } 
            memcpy((char*)tmp_state, tranc_from, tranc_end - tranc_from);
            tmp_state[tranc_end - tranc_from] = '\0';

            switch (now_on)
            {
            case 0:
                from_state = atoi(tmp_state);
                // printf("%d,", from_state);
                break;
            case 1:
                to_state = atoi(tmp_state);
                // printf("%d,", to_state);
                break;
            case 2:
                symbol = tmp_state[0];
                // printf("%c\n", symbol);
                break;
            default:
                break;
            }

            tranc_end ++;
            now_on ++;
        }

        (dfa->table)[from_state][(dfa->symbol_reverse_map)[symbol]] = to_state;
        now_on = 0;
    }


    fclose(dfa_file);
    return dfa;
}