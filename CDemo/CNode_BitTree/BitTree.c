//
//  BitTree.c
//  CNode_BitTree
//
//  Created by MOLBASE on 2018/8/16.
//  Copyright © 2018年 YangShen. All rights reserved.
//

#include "BitTree.h"

void CreateTree(BitTree *T) {
    char c;
    scanf("%c", &c);
    if (c == ' ') {
        *T = NULL;
    } else {
        *T = (BitNode *)malloc(sizeof(BitNode));
        (*T)->data = c;
        CreateTree(&((*T)->lchild));
        CreateTree(&((*T)->rchild));
    }
}

void Visit(char c, int level) {
    if (c == 'D') {
        printf("%c is at %d level of BitTree.\n", c, level);
    }
}

// 遍历二叉树：先序
void PreOrderTraverse(BitTree T, int level) {
    if (T) {
        Visit(T->data, level);
        PreOrderTraverse(T->lchild, level+1);
        PreOrderTraverse(T->rchild, level+1);
    }
}

// 遍历二叉树：中序
void InOrderTraverse(BitTree T, int level) {
    if (T) {
        InOrderTraverse(T->lchild, level+1);
        Visit(T->data, level);
        InOrderTraverse(T->rchild, level+1);
    }
}

// 遍历二叉树：后序
void PosOrderTraverse(BitTree T, int level) {
    if (T) {
        PosOrderTraverse(T->lchild, level+1);
        PosOrderTraverse(T->rchild, level+1);
        Visit(T->data, level);
    }
}





