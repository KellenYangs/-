//
//  StackList.c
//  CDemo_Stack
//
//  Created by MOLBASE on 2018/8/16.
//  Copyright © 2018年 YangShen. All rights reserved.
//

#include "StackList.h"

#define STACKINCREMENT 10

void initStack(sqStack *s) {
    // 内存开辟一块连续的空间作为栈空间，首地址赋给s->base
    s->base = (ElemType *)malloc(STACK_INIT_SIZE * sizeof(ElemType));
    if (!s->base) {
        exit(0);
    }
    s->top = s->base;
    s->stacksize = STACK_INIT_SIZE;
}

void Push(sqStack *s, ElemType e) {
    if (s->top - s->base >= s->stacksize) {
        // 栈满，追加空间
        s->base = (ElemType *)realloc(s->base, (s->stacksize+STACKINCREMENT)*sizeof(ElemType));
        if (!s->base) {
            exit(0);
        }
        s->top = s->base + s->stacksize;
        s->stacksize += STACKINCREMENT;
    }
    *(s->top) = e;
    s->top++;
}

void Pop(sqStack *s, ElemType *e) {
    if (s->top == s->base) {
        return;
    }
    *e = *--(s->top);
}

void ClearStack(sqStack *s) {
    s->top = s->base;
}

void DestoryStack(sqStack *s) {
    int i, len;
    len = s->stacksize;
    for (i = 0; i < len; i++) {
        s->base = NULL;
        s->base++;
    }
    s->base = s->top = NULL;
    s->stacksize = 0;
}

int StackLen(sqStack *s) {
    return (s->top - s->base);
}
