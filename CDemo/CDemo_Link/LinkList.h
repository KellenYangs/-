//
//  LinkList.h
//  CDemo_Link
//
//  Created by MOLBASE on 2018/8/16.
//  Copyright © 2018年 YangShen. All rights reserved.
//

#ifndef LinkList_h
#define LinkList_h

#include <stdio.h>

typedef int ElemType;

typedef struct node {
    ElemType data;      // 数据域
    struct node *next;  // 指针域
}LNode, *LinkList;

LinkList GreatLinkList(int n);
void insertList(LinkList *list, LinkList q, ElemType e);
void DelLink(LinkList *list, LinkList q);
void destoryLinkList(LinkList *list);

#endif /* LinkList_h */
