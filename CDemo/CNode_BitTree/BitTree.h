//
//  BitTree.h
//  CNode_BitTree
//
//  Created by MOLBASE on 2018/8/16.
//  Copyright © 2018年 YangShen. All rights reserved.
//

#ifndef BitTree_h
#define BitTree_h

#include <stdio.h>

typedef int ElemType;

typedef struct BitNode {
    ElemType data;
    struct BitNode *lchild, *rchild;
}BitNode, *BitTree;

void CreateTree(BitTree *T);
void Visit(char c, int level);
void PreOrderTraverse(BitTree T, int level);
void InOrderTraverse(BitTree T, int level);
void PosOrderTraverse(BitTree T, int level) ;

#endif /* BitTree_h */
