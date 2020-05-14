#ifndef SIMPLE_EVAL_H
#define SIMPLE_EVAL_H

#include <stdio.h>
#include <stdlib.h>

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
};


typedef struct token{
    enum token_type type;
    union {
        int int_value;
        char char_value[MAX_TOKEN];
    } t_value;
} token_t;


typedef struct token_node
{
    token_t token;
    tnode_t *next;
} tnode_t;

tnode_t *get_token(char* input, int len);


#endif