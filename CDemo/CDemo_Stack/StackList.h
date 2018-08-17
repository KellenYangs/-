//
//  StackList.h
//  CDemo_Stack
//
//  Created by MOLBASE on 2018/8/16.
//  Copyright © 2018年 YangShen. All rights reserved.
//

#ifndef StackList_h
#define StackList_h

#include <stdio.h>

#define STACK_INIT_SIZE 100

typedef int ElemType;
typedef struct {
    ElemType *base; // 栈底指针
    ElemType *top;  // 栈顶指针
    int stacksize;  // 栈大小
}sqStack;

void initStack(sqStack *s);
void Push(sqStack *s, ElemType e);
void Pop(sqStack *s, ElemType *e);
void ClearStack(sqStack *s);
void DestoryStack(sqStack *s);
int StackLen(sqStack *s);

#endif /* StackList_h */
