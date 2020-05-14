#ifndef DFA_H
#define DFA_H
#include <stdio.h>
#include <stdlib.h>


#define ASCII_COUNT 256
#define MAX_STATE 256
#define DEAD_STATE -1
#define NO_MAP -1

typedef struct dfa {
    // DFA transition table
    // Example: 
    //  Assuming the symbol 'a' has an index of 8 (see below symbol_reverse_map)
    //  the transition (S1 --'a'--> S2) would appear in table
    //  like: table[1][8] = 2;
    int **table; 
    int symbols;
    int state;
    int start_state;
    int accept_state;
    // mapping map[symbol(ASCII char)] = index
    int symbol_reverse_map[ASCII_COUNT];
    // mapping map[index] = symbol(ASCII char)
    char symbol_map[ASCII_COUNT];
} dfa_t;

int run_dfa(dfa_t *dfa, char* input, int len);
dfa_t *read_dfa(const char* dfa_filep);
void print_dfa(dfa_t *dfa);

#endif