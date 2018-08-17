//
//  LinkQueue.c
//  CDemo_Queue
//
//  Created by MOLBASE on 2018/8/16.
//  Copyright © 2018年 YangShen. All rights reserved.
//

#include "LinkQueue.h"

void InitQueue(LinkQueue *q) {
    q->front = q->rear = (QueuePtr)malloc(sizeof(QNode));
    if (!q->front) {
        exit(0);
    }
    q->front->next = NULL;
}

void EnQueue(LinkQueue *q, QElemType e) {
    QueuePtr p;
    p = (QueuePtr)malloc(sizeof(QNode));
    if (!q->front) {
        exit(0);
    }
    p->data = e;
    p->next = NULL;
    q->rear->next = p;
    q->rear = p;
}

void DeQueue(LinkQueue *q, QElemType *e) {
    QueuePtr p;
    if (q->front == q->rear) {
        return;
    }
    p = q->front->next;
    *e = p->data;
    q->front->next = p->next;
    if (q->rear == p) { // 对头就是队尾
        q->rear = q->front;
    }
    p = NULL;
}

void DestoryQueue(LinkQueue *q) {
    while (q->front) {
        q->rear = q->front->next;
        q->front = NULL;
        q->front = q->rear;
    }
}

// 循环队列
#define MAXQSIZE 100
void cInitQueue(CycyleQueue *q) {
    q->base = (QElemType *)malloc(MAXQSIZE*sizeof(QElemType));
    if (!q->base) {
        exit(0);
    }
    q->front = q->rear = 0;
}

void cEnQueue(CycyleQueue *q, QElemType e) {
    if ((q->rear + 1) % MAXQSIZE == q->front) {
        return; // 队满
    }
    q->base[q->rear] = e;
    q->rear = (q->rear + 1) % MAXQSIZE;
}

void cDeQueue(CycyleQueue *q, QElemType *e) {
    if (q->front == q->rear) {
        return;//对空
    }
    *e = q->base[q->front];
    q->front = (q->front + 1) % MAXQSIZE;
}





















