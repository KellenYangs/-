//
//  main.m
//  CDemo_Queue
//
//  Created by MOLBASE on 2018/8/16.
//  Copyright © 2018年 YangShen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkQueue.h"

void testQueue() ;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");

        testQueue();
    }
    return 0;
}

void testQueue() {
    LinkQueue q;
    char e;
    InitQueue(&q);
    printf("Please input a string into a queue.\n");
    scanf("%c", &e);
    while (e != '@') {
        EnQueue(&q, e);
        scanf("%c", &e);
    }

    printf("The string into a queue.\n");
    while (q.front != q.rear) {
        DeQueue(&q, &e);
        printf("%c", e);
    }
    printf("\n");

}
