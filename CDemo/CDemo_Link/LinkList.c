//
//  LinkList.c
//  CDemo_Link
//
//  Created by MOLBASE on 2018/8/16.
//  Copyright © 2018年 YangShen. All rights reserved.
//

#include "LinkList.h"

/**
 创建一个长度为n的链表

 @param n 长度
 */
LinkList GreatLinkList(int n) {
    LinkList p, r = NULL, head = NULL;
    int i;
    ElemType e;
    scanf("%d", &e);
    for (i = 0; i < n; i++) {
        p = (LinkList)malloc(sizeof(LinkList));
        p->data = e;
        p->next = NULL;
        if (!head) {
            head = p;
        } else {
            r->next = p;
        }
        r = p;
    }
    return head;
}


/**
 向链表中插入节点

 @param list 只想链表的指针
 @param q 插入节点位置
 @param e 插入数据
 */
void insertList(LinkList *list, LinkList q, ElemType e) {
    LinkList p;
    p = (LinkList)malloc(sizeof(LinkList));
    p->data = e;
    if (!*list) {
        *list = p;
        p->next = NULL;
    } else {
        p->next = q->next;
        q->next = p;
    }
}


/**
 删除链表

 @param list 链表指针
 @param q 要删除的链表
 */
void DelLink(LinkList *list, LinkList q) {
    LinkList r;
    if (q == *list) {
        *list = q->next;
        q = NULL;
    } else {
        for (r = *list; r->next != q; r = r->next); // 找到q的前驱节点
        if (r->next != NULL) {
            r->next = q->next;
            q = NULL;
        }
    }
}

void destoryLinkList(LinkList *list) {
    LinkList p,q;
    p = *list;
    while (p) {
        q = p->next;
        p = NULL;
        p = q;
    }
    *list = NULL;
}





