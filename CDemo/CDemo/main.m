//
//  main.m
//  CDemo
//
//  Created by MOLBASE on 2018/8/16.
//  Copyright © 2018年 YangShen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StaticSequenceList.h"
#import "DynamicSequenceList.h"

void testStaticSequenceList(void);
void testDynamicSequenceList(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");

//        testStaticSequenceList();

        testDynamicSequenceList();
    }
    return 0;
}

void testStaticSequenceList() {
    int Sqlist[SMaxSize];
    int len = 6;
    int i;
    printf("Please input some nums...");
    for (i = 0; i < len; i++) {
        scanf("%d", &Sqlist[i]);
    }

    for (i = 0; i < len; i++) {
        printf("%d ", Sqlist[i]);
    }
    printf("\nThe spare length is %d.\n", SMaxSize - len);

    insertElem(Sqlist, &len, 3, 0);
    for (i = 0; i < len; i++) {
        printf("%d ", Sqlist[i]);
    }
    printf("\nThe spare length is %d.\n", SMaxSize - len);

    insertElem(Sqlist, &len, 11, 0);
    delElem(Sqlist, &len, 6);
    for (i = 0; i < len; i++) {
        printf("%d ", Sqlist[i]);
    }
    printf("\nThe spare length is %d.\n", SMaxSize - len);

}

void testDynamicSequenceList() {
    Sqlist l;
    int  i;
    initSqlist(&l);
    for (i = 0; i < 15; i++) {
        dinsertElem(&l, i+1, i+1);
    }
    printf("\nThe content of the list is\n");
    for (i = 0; i < l.length; i++) {
        printf("%d ", l.elem[i]);
    }
    ddelElem(&l, 5);
    printf("\nThe content of the list is\n");
    for (i = 0; i < l.length; i++) {
        printf("%d ", l.elem[i]);
    }
}
