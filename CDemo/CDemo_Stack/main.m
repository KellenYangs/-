//
//  main.m
//  CDemo_Stack
//
//  Created by MOLBASE on 2018/8/16.
//  Copyright © 2018年 YangShen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StackList.h"
void testStackList(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        testStackList();
    }
    return 0;
}

void testStackList() {
    ElemType c;
    sqStack s;
    int len, i, sum = 0;

    initStack(&s);
    printf("Please input a Binary digit\n");
    scanf("%c", &c);
    while (c != '#') {
        Push(&s, c);
        scanf("%c", &c);
    }
    getchar();
    len = StackLen(&s);

    for (int i = 0; i < len; i++) {
        Pop(&s, &c);
//        printf("%c ", c);

        sum = sum + (c - 48) * pow(2, i);
    }
    printf("Decimal is %d\n", sum);
}
