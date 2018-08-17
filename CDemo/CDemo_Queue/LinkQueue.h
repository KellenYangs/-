//
//  LinkQueue.h
//  CDemo_Queue
//
//  Created by MOLBASE on 2018/8/16.
//  Copyright © 2018年 YangShen. All rights reserved.
//

#ifndef LinkQueue_h
#define LinkQueue_h

#include <stdio.h>
typedef char QElemType;

typedef struct QNode {
    QElemType data;
    struct QNode *next;
} QNode, *QueuePtr;

typedef struct {
    QueuePtr front; // 对头
    QueuePtr rear;  // 队尾
} LinkQueue;

void InitQueue(LinkQueue *q);
void EnQueue(LinkQueue *q, QElemType e);
void DeQueue(LinkQueue *q, QElemType *e);
void DestoryQueue(LinkQueue *q);

// 循环队列
typedef struct {
    QElemType *base;
    int front;
    int rear;
}CycyleQueue;



#endif /* LinkQueue_h */
