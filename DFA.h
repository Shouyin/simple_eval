#ifndef DFA_H
#define DFA_H
#include <stdio.h>
#include <stdlib.h>

struct state_t {
    char* name;
};

struct symbol_t {
    char symbol;
};


#define ASCII_COUNT 256
#define MAX_STATE 256
#define DEAD_STATE -1
#define NO_MAP -1

typedef struct dfa {
    int **table;
    int symbols;
    int state;
    int start_state;
    int accept_state;
    int symbol_reverse_map[ASCII_COUNT];
    char symbol_map[ASCII_COUNT];
} dfa_t;

int run_dfa(dfa_t *dfa, char* input, int len);
dfa_t *read_dfa(const char* dfa_filep);
void print_dfa(dfa_t *dfa);

#endif