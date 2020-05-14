#ifndef SIMPLE_EVAL_H
#define SIMPLE_EVAL_H

#include <stdio.h>
#include <stdlib.h>
#include "AST.h"

#define MAX_TOKEN 8

enum token_type{
    TOKEN_OPRAND = 1,
    TOKEN_LPARTHESIS,
    TOKEN_RPARTHESIS,
    TOKEN_WHITESPACE,
    TOKEN_PLUS,
    TOKEN_MINUS,
    TOKEN_TIMES,
    TOKEN_DIVIDE,
    TOKEN_NULL,
};


typedef struct token{
    enum token_type type;
    char* start_at;
    char* end_at;
} token_t;


typedef struct token_node
{
    token_t token;
    struct token_node *next;
} tnode_t;


astnode_t *cfg_t(char *input, char **r_rest);
astnode_t *cfg_e(char *input, char **r_rest);
token_t *peek(char* input);
int end_at_edge(char *c);
int eval(astnode_t *root);

#endif