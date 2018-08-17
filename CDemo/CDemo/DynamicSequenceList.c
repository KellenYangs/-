//
//  DynamicSequenceList.c
//  CDemo
//
//  Created by MOLBASE on 2018/8/16.
//  Copyright © 2018年 YangShen. All rights reserved.
//

#import "DynamicSequenceList.h"


/**
 初始化一个动态顺序表

 @param L Sqlist类型的指针
 */
void initSqlist(Sqlist *L) {
    L->elem = (ElemType *)malloc(DMaxSize * sizeof(ElemType)); // 首地址
    if (!L->elem) {
        exit(0);
    }
    L->length = 0;
    L->listsize = DMaxSize;
}


/**
 动态顺序表插入元素

 @param L Sqlist类型的指针
 @param i 插入元素的位置
 @param item 插入元素
 */
void dinsertElem(Sqlist *L, int i, ElemType item) {
    ElemType *base, *insertPtr, *p;
    if (1 < 1 || i > L->length+1) {
        exit(0);
    }
    if (L->length >= L->listsize) {
        base = (ElemType *)realloc(L->elem, (L->listsize + 10) * sizeof(ElemType));
        L->elem = base;
        L->listsize = DMaxSize + 10;
    }
    insertPtr = &(L->elem[i-1]);
    for (p = &(L->elem[L->length-1]); p >= insertPtr; p--) {
        *(p+1) = *p;
    }
    *insertPtr = item;
    L->length++;
}


/**
 动态表删除元素

 @param L Sqlist类型的指针
 @param i 插入元素的位置
 */
void ddelElem(Sqlist *L, int i) {
    ElemType *delElem, *p;
    if (i < 1 || i > L->length) {
        exit(0);
    }
    delElem = &(L->elem[i-1]);
    p = L->elem + L->length - 1;
    for (++delElem; delElem <= p; ++delElem) {
        *(delElem-1) = *delElem;
    }
    L->length--;
}







