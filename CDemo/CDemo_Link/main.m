//
//  main.m
//  CDemo_Link
//
//  Created by MOLBASE on 2018/8/16.
//  Copyright © 2018年 YangShen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkList.h"

void testLinkList(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");

        testLinkList();
    }
    return 0;
}

void testLinkList() {
    int e, i;
    LinkList l,q;
    q=l=GreatLinkList(1);
    scanf("%d",&e);
    while (e) {
        insertList(&l, q, e);
        q=q->next;
        scanf("%d", &e);
    }
    q=l;
    printf("The content of the linklist.\n");
    while (q) {
        printf("%d ", q->data);
        q = q->next;
    }
    q = l;
    // 删除底5个元素
    printf("\nDelete the fifth element\n");
    for (i = 0; i < 4; i++) {
        q = q->next;
    }
    DelLink(&l, q);
    q = l;
    printf("The content of the linklist.\n");
    while (q) {
        printf("%d ", q->data);
        q = q->next;
    }
    // 释放链表
    destoryLinkList(&l);
}
