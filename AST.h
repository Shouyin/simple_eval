#ifndef AST_H
#define AST_H

#include <stdio.h>
#include <stdlib.h>
#include "simple_eval.h"

enum eval_action {
    EVAL_PLUS = 1,
    EVAL_TIMES,
    EVAL_DIVIDE,
    EVAL_MINUS,
    EVAL_DIGI,
    EVAL_PARTHESIS,
};

typedef struct ast_node {
    enum eval_action e_act;
    union {
        struct {
            struct ast_node *left;
            struct ast_node *right;
        } double_child;
        struct {
            struct ast_node *child;
        } single_child;
    } children;
    union {
        int int_value;
    } value;
    struct ast_node *parent;
} astnode_t;


#endif