/*
 * simple_eval.c
 * Main module of the simple eval project
 * Using basic lexical analysis and top-down parsing techniques
 * to achieve a simple calculator supporting operators +-*\/()
 * 
 * Currently AST functions are integrated in this module
 * but later will be splited out
 * 
 * Simple eval project:
 * https://github.com/Shouyin/simple_eval
 * 
 * Maoting Zuo (Shouyin)
 * https://github.com/Shouyin
 * 
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "simple_eval.h"
#include "AST.h"

int main(int argc, char *argv[]) {

    char* input = "(3 + 9) * 8";
    astnode_t *ast;
    char* rest;
    char inputcs[200];

    printf("Simple eval interpreter\n");

    while(1) {
        printf("eval> ");
        gets((char*)inputcs);
        ast = cfg_e((char *)inputcs, &rest);
        // char* test_edge = ")";
        // printf("test: %d\n", end_at_edge(test_edge));
        if(ast == NULL) {
            printf("fuck\n");
        } else {
            while(ast->parent != NULL) ast = ast->parent;
        }
        printf("[eval->] %d\n", eval(ast));
        free_ast(ast);
    }

    // printf("eval: %d\n", eval(ast));

    // printf("act=%d\n", ast->e_act);
    // printf("rest: %s\n", rest);

    return 0;
}

void free_ast(astnode_t *ast) {
    switch (ast->e_act) {
        case EVAL_PLUS:
        case EVAL_TIMES:
        case EVAL_DIVIDE:
        case EVAL_MINUS:
            free_ast(ast->children.double_child.left);
            free_ast(ast->children.double_child.right);
            break;
        case EVAL_PARTHESIS:
            free_ast(ast->children.single_child.child);
            break;
        default:
            break;
    }
    free(ast);
}


int eval(astnode_t *root) {
    switch (root->e_act) {
        case EVAL_PLUS:
            return eval(root->children.double_child.left) + \
            eval(root->children.double_child.right);
        case EVAL_MINUS:
            return eval(root->children.double_child.left) - \
            eval(root->children.double_child.right);
        case EVAL_TIMES:
            return eval(root->children.double_child.left) * \
            eval(root->children.double_child.right);
        case EVAL_DIVIDE:
            return eval(root->children.double_child.left) / \
            eval(root->children.double_child.right);
        case EVAL_DIGI:
            return root->value.int_value;
        case EVAL_PARTHESIS:
            return eval(root->children.single_child.child);
    }
}


static astnode_t *new_node(enum eval_action act) {
    astnode_t *node = (astnode_t *)malloc(sizeof(astnode_t));
    node->e_act = act;
    node->parent = NULL;
    return node;
}


static token_t *new_token(enum token_type tp, char* start_at, char* end_at) {
    token_t *token = (token_t *)malloc(sizeof(token_t));
    token->type = tp;
    token->start_at = start_at;
    token->end_at = end_at;
    return token;
}


token_t *peek(char* input) {
    token_t *token;
    int len = 1;
    enum token_type ty;
    char* start_at = input;
    while(*input == ' ') {
        input ++; 
        start_at++;
    }
    switch (*input) {
        case '(':
            ty = TOKEN_LPARTHESIS;
            break;
        case ')':
            ty = TOKEN_RPARTHESIS;
            break;
        case '+':
            ty = TOKEN_PLUS;
            break;
        case '-':
            ty = TOKEN_MINUS;
            break;
        case '*':
            ty = TOKEN_TIMES;
            break;
        case '/':
            ty = TOKEN_DIVIDE;
            break;
        case '\0':
        case '\n':
            ty = TOKEN_NULL;
            break;
        default:
            if(*input >= 48 && *input <= 57) {
                ty = TOKEN_OPRAND;
                while(*input >= 48 && *input <= 57) input ++;
                len = input - start_at;
                break;
            }
            return NULL;
    }
    token = new_token(ty, start_at, start_at + len);

    return token;
}


const char edge[] = ")\t\n\0\v";


int end_at_edge(char *c) {
    while(*c == ' ') c++;
    return strchr((const char *)edge, *c) != NULL;
}


astnode_t *cfg_e(char *input, char **r_rest) {
    // printf("input to e: %s\n", input);
    astnode_t *cnode;
    astnode_t *l_node;
    astnode_t *r_node;
    astnode_t *parent_node;
    char* rest;

    token_t *peeked;
    peeked = peek(input);

    if(peeked->type == TOKEN_LPARTHESIS) {
        l_node = cfg_e(peeked->end_at, &rest);
        //printf("??????\n");
        if(l_node == NULL) {
            free(peeked);
            return NULL;
        }
        free(peeked);
        peeked = peek(rest);
        if(peeked->type == TOKEN_RPARTHESIS) {
            cnode = new_node(EVAL_PARTHESIS);
            while(l_node->parent != NULL)l_node = l_node->parent;
            cnode->children.single_child.child = l_node;
            l_node->parent = cnode;
            
            if(end_at_edge(peeked->end_at)) {
                if(r_rest != NULL) {
                    *r_rest = peeked->end_at;
                }
                free(peeked);
                return cnode;
            }

            parent_node = cfg_t(peeked->end_at, &rest);
            //printf("??\n");
            if(parent_node == NULL) {
                free(peeked);
                return NULL;
            }
            parent_node->children.double_child.left = cnode;
            cnode->parent = parent_node;

            if(r_rest != NULL) {
                *r_rest = rest;
            }

            return parent_node;
        } else {
            free(peeked);
            return NULL;
        }
    } else if(peeked->type == TOKEN_OPRAND) {

        cnode = new_node(EVAL_DIGI);
        char *tmp = (char*)malloc((peeked->end_at - peeked->start_at + 1) * sizeof(char));
        memcpy(tmp, peeked->start_at, peeked->end_at - peeked->start_at);
        tmp[peeked->end_at - peeked->start_at] = '\0';
        cnode->value.int_value = atoi(tmp);
        // printf("tmp: %s\n", tmp);
        free(tmp);

        if(end_at_edge(peeked->end_at)) {
            // printf("what here\n");
            if(r_rest != NULL) {
                *r_rest = peeked->end_at;
            }
            free(peeked);
            return cnode;
        } else {
            //printf("oprand, end_at to t: %s\n", peeked->end_at);
            parent_node = cfg_t(peeked->end_at, &rest);
            //printf("back to here\n");

            if(parent_node == NULL) {
                free(peeked);
                return NULL;
            }
            
            parent_node->children.double_child.left = cnode;
            cnode->parent = parent_node;

            if(r_rest != NULL) {
                *r_rest = rest;
            }
            
            free(peeked);
            return parent_node;
        }
    } 
    // printf("what?\n");

    free(peeked);
    return NULL;
}


astnode_t *cfg_t(char *input, char **r_rest) {
    // printf("input to t: %s\n", input);
    astnode_t *cnode;
    astnode_t *r_node;
    astnode_t *parent_node;
    enum eval_action act;

    char* rest;

    token_t *peeked;
    peeked = peek(input);

    switch (peeked->type) {
        case TOKEN_PLUS:
            act = EVAL_PLUS;
            break;
        case TOKEN_MINUS:
            act = EVAL_MINUS;
            break;
        case TOKEN_TIMES:
            act = EVAL_TIMES;
            break;
        case TOKEN_DIVIDE:
            act = EVAL_DIVIDE;
            break;
        default:
            break;
    }

    r_node = cfg_e(peeked->end_at, &rest);
    // printf("after t e\n");
    if(r_node == NULL) {
        free(peeked);
        return NULL;
    }

    cnode = new_node(act);
    if(((act == EVAL_PLUS || act == EVAL_MINUS) && (
        r_node->e_act == EVAL_PARTHESIS || r_node->e_act == EVAL_TIMES || r_node->e_act == EVAL_DIVIDE)) ||
        r_node->e_act == EVAL_DIGI) {
            // printf("?1\n");
            cnode->children.double_child.right = r_node;
            r_node->parent = cnode;
        } else {
            cnode->children.double_child.right = r_node->children.double_child.left;
            r_node->children.double_child.left = cnode;
            cnode->parent = r_node;
        }
        if(r_rest != NULL) {
            *r_rest = rest;
        }
        free(peeked);
        return cnode;
    
}



