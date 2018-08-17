//
//  main.m
//  Problem
//
//  Created by MOLBASE on 2018/8/17.
//  Copyright © 2018年 YangShen. All rights reserved.
//

#import <Foundation/Foundation.h>

float yspow(float x, int n);
void getPrime(int low, int high);
void tomBook();
int factorial(int n);
int P(int n, int m);
int bin_search(int a[], int low, int high, int k);

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        printf("2pow3: %f\n", yspow(2, 3));
        printf("2pow4: %f\n", yspow(2, 4));

        printf("\n1-100之间素数：");
        getPrime(1, 100);

        printf("\n\nTom借书\n");
        tomBook();

        printf("\n阶乘");
        printf("5的阶乘：%d\n", factorial(5));

        printf("\n6的划分数：%d\n", P(6, 6));

        int a[] = {2,3,5,6,7,8,9,0};
        printf("\n二分查找-5的位置：%d\n", bin_search(a, 0 , 8, 5));
        printf("二分查找-4的位置：%d\n", bin_search(a, 0 , 8, 4));


    }
    return 0;
}

// 递归的折半查找算法
int bin_search(int a[], int low, int high, int k) {
    int mid;
    if (low > high) {
        return -1;
    }
    mid = (low + high) / 2;
    if (a[mid] == k) {
        return mid;
    } else if (a[mid] < k) {
        return bin_search(a, mid+1, high, k);
    } else {
        return bin_search(a, low, mid-1, k);
    }
}

// 整数的划分数
int P(int n, int m) {
    if (m == 1) {
        return 1;
    }
    if (m > n) {
        return P(n, n);
    }
    if (m == n) {
        return 1 + P(n, m - 1);
    }
    return P(n, m - 1) + P(n - m, m);
}

// 递归
// 1. n的阶乘
int factorial(int n) {
    if (n == 1) {
        return 1;
    }
    return n*(factorial(n-1));
}

// Tom有5本新书，借给三位同学，借法
// 5 x 4 x 3 = 60
void tomBook() {
    int count = 0;
    for (int i = 1; i <= 5; i++) {
        for (int j = 1; j <= 5; j++) {
            for (int k = 1; k <= 5; k++) {
                if (i != j && j != k && i != k) {
                    count++;
                    printf("(%d, %d, %d), ", i, j, k);
                }
            }
        }
    }
    printf("\n共有%d种借法\n", count);
}

// [1, 100]之间素数
bool isPrime(int n) {
    int i;
    int k = sqrt(n);
    for (i = 2; i <= k; i++) {
        if (n % i == 0) {
            return false;
        }
    }
    return true;
}

void getPrime(int low, int high) {
    for (int i = low; i <= high; i++) {
        if (isPrime(i)) {
            printf("%d ", i);
        }
    }
}

// 2^n次方算法设计 pow方法
float yspow(float x, int n) {
    if (n == 0) {
        return 1.0;
    }
    if (n == 1) {
        return x;
    }
    if (n % 2 == 0) {
        return yspow(x*x, n/2);
    } else {
        return yspow(x*x, n/2)*x;
    }
}
