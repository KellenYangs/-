//
//  main.m
//  CNode_BitTree
//
//  Created by MOLBASE on 2018/8/16.
//  Copyright © 2018年 YangShen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BitTree.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");

        BitTree T;
        int level = 1;
        CreateTree(&T);
        PreOrderTraverse(T, level);
    }
    return 0;
}
