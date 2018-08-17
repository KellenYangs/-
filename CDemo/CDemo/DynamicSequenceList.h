//
//  DynamicSequenceList.h
//  CDemo
//
//  Created by MOLBASE on 2018/8/16.
//  Copyright © 2018年 YangShen. All rights reserved.
//

#ifndef DynamicSequenceList_h
#define DynamicSequenceList_h

#include <stdio.h>
#define DMaxSize  10

typedef int ElemType;

typedef struct {
    int *elem;
    int length;
    int listsize;
} Sqlist;

void initSqlist(Sqlist *L);
void dinsertElem(Sqlist *L, int i, ElemType item);
void ddelElem(Sqlist *L, int i);

#endif /* DynamicSequenceList_h */
