//
//  StaticSequenceList.c
//  CDemo
//
//  Created by MOLBASE on 2018/8/16.
//  Copyright © 2018年 YangShen. All rights reserved.
//
//  顺序表操作

#import "StaticSequenceList.h"

/**
 向顺序表中插入元素

 @param Sqlist 表首地址
 @param len 表长度
 @param i 插入元素位置
 @param x 插入元素
 */
void insertElem(int Sqlist[], int *len, int i, int x) {

    int  t;
    if (*len == SMaxSize || i < 1 || i > *len + 1) {
        printf("This insert is illegal. \n");
        return;
    }

    for (t = *len-1; t >= i - 1; t--) {
        Sqlist[t+1] = Sqlist[t];
    }
    Sqlist[i - 1] = x;
    *len = *len + 1;
}


/**
 顺序表删除元素

 @param Sqlist 表首地址
 @param len 表长度
 @param i 删除元素的位置
 */
void delElem(int Sqlist[], int *len, int i) {

    int j;
    if (i < 1 || i > *len) {
        printf("This delete is illegal. \n");
        return;
    }

    for (j = i; j <= *len - 1; j++) {
        Sqlist[j-1] = Sqlist[j];
    }

    *len = *len - 1;
}























