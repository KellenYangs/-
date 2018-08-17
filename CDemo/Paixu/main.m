//
//  main.m
//  Paixu
//
//  Created by MOLBASE on 2018/8/16.
//  Copyright © 2018年 YangShen. All rights reserved.
//
// 算法动图展示
// https://www.cnblogs.com/onepixel/articles/7674659.html

#import <Foundation/Foundation.h>

void swap(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

// 选择排序
void xuanzeSort(int a[], int n);
// 插入排序
void insertSort(int a[], int n);
void insertTwoSort(int a[], int n);
// 冒泡排序
void bubbleSort(int a[], int n);
void bubbleSort1(int a[], int n);
void bubbleSort2(int a[], int n);

// 希尔排序
void shellSort(int a[], int n);
// 归并排序
void mergeSort(int a[], int n);
// 快速排序
void quickSort(int a[], int s, int t);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...

        int i, a[11] = {8,-111,2,5,6,3,7,0,9,12,1};
        int len = sizeof(a) / sizeof(a[0]); // 只能在定义处这样使用

        printf("排序前......\n");
        for (i = 0; i < len; i++) {
            printf("%d ", a[i]);
        }
        printf("\n");

        // 选择排序
//        xuanzeSort(a, len);
        // 插入排序
//        insertSort(a, len);
//        insertTwoSort(a, len);
//        shellSort(a, len);
        // 冒泡排序
//        bubbleSort(a, len);
//        bubbleSort1(a, len);
//        bubbleSort2(a, len);

//        mergeSort(a, len);
        quickSort(a, 0, len-1);

        printf("排序后......\n");
        for (i = 0; i < len; i++) {
            printf("%d ", a[i]);
        }
        printf("\n");
    }
    return 0;
}

// 选择排序
void xuanzeSort(int a[], int n) {
    printf("选择排序执行中...\n");
    int i,j,min;
    int temp;;
    for (i = 0; i < n; i++) {
        min = i;
        for (j = i+1; j < n; j++) {
            if (a[j] < a[min]) {
                min = j;
            }
        }

        if (min != i) {
            temp = a[i];
            a[i] = a[min];
            a[min] = temp;
        }
    }
}

// 冒泡排序
void bubbleSort(int a[], int n) {
    printf("冒泡排序执行中...\n");
    int i,j;
    int temp;
    for (i = 0; i < n; i++) {
        for (j = 0; j < n-1-i; j++) {
            if (a[j] > a[j+1]) {
                temp = a[j];
                a[j] = a[j+1];
                a[j+1] = temp;
            }
        }
    }
}

// 冒泡排序改1
// 当冒泡排序时，可以获取最后交换的位置，哪里可以确定后面是顺序的了，然后在对之前的进行冒泡就行，可以省略几次循环
// 比如：
// 3 2 4 6 8
// 冒泡交换 3 与 2 的位置，此时在 2之后的都是确定的排好序的就无需在冒泡了
// 下一轮冒泡只要到 2 位置就好了
void bubbleSort1(int a[], int n) {
    printf("(改1)冒泡排序执行中...\n");
    int i = n - 1,j,pos;
    int temp;
    while (i > 0) {
        pos = 0;
        for (j = 0; j < i; j++) {
            if (a[j] > a[j+1]) {
                temp = a[j];
                a[j] = a[j+1];
                a[j+1] = temp;
                pos = j;
            }
        }
        i = pos;
    }
}

// 冒泡排序改2
// 通过改1进化而来
// 使用两个标识符：low(之前都排好续了) high(之后都排好序了)
// 每次先冒泡得到high 再次冒泡得到low
void bubbleSort2(int a[], int n) {
    printf("(改2)冒泡排序执行中...\n");

    int low = 0, high = n - 1;
    int j;
    int temp;
    while (low < high) {
        int low_pos = 0, high_pos = 0;
        for (j = low; j < high; j++) {
            if (a[j] > a[j+1]) {
                temp = a[j];
                a[j] = a[j+1];
                a[j+1] = temp;
                high_pos = j;
            }
        }
        high = high_pos;

        for (j = high; j > low; j--) {
            if (a[j] < a[j-1]) {
                temp = a[j];
                a[j] = a[j-1];
                a[j-1] = temp;
                low_pos = j;
            }
        }
        low = low_pos;
    }
}

// 插入排序
void insertSort(int a[], int n) {
    printf("插入排序执行中...\n");
    int i, j;
    for (i = 1; i < n; i++) {
        int temp = a[i];
        for (j = i; j > 0 && a[j-1] > temp; --j) {
            a[j] = a[j-1];
        }
        a[j] = temp;
    }
}

// 二分查找法 二分插入排序
void insertTwoSort(int a[], int n) {
    printf("二分查找插入排序执行中...\n");
    int i, j;
    int left, right, middle;
    int key;
    for (i = 1; i < n; i++) {
        key = a[i];
        left = 0;
        right = i - 1;
        while (left <= right) {
            middle = (left + right) / 2;
            if (key < a[middle]) {
                right = middle - 1;
            } else {
                left = middle + 1;
            }
        }
        for (j = i - 1; j >= left; j--) {
            a[j+1] = a[j];
        }
        a[left] = key;
    }
}

// 希尔排序 缩小增量排序。
// 选择一个增量序列t1，t2，…，tk，其中ti>tj，tk=1；
// 按增量序列个数k，对序列进行k 趟排序；
// 每趟排序，根据对应的增量ti，将待排序列分割成若干长度为m 的子序列，分别对各子表进行直接
// 插入排序。仅增量因子为1 时，整个序列作为一个表来处理，表长度即为整个序列的长度。
void shellSort(int a[], int n) {
    printf("希尔排序执行中...\n");
    int i, j, flag, gap = n;
    int tmp;
    while (gap > 1) {
        gap = gap / 2;
        do {
            flag = 0;
            for (i = 0; i < n - gap; i++) {
                j = i + gap;
                if (a[i] > a[j]) {
                    tmp = a[i];
                    a[i] = a[j];
                    a[j] = tmp;
                    flag = 1;
                }
            }
        } while (flag != 0);
    }
}

// 归并排序
// 把长度为n的输入序列分成两个长度为n/2的子序列；
// 对这两个子序列分别采用归并排序；
// 将两个排序好的子序列合并成一个最终的排序序列。
void merge(int a[],int temp[],int l,int r,int rightEnd) { //合并两个有序序列
    int leftEnd = r - 1;
    int p = l, i;
    int num = rightEnd - l + 1;
    while(l <= leftEnd && r <= rightEnd)
        if(a[l] <= a[r])
            temp[p++] = a[l++];
        else
            temp[p++] = a[r++];

    while(l <= leftEnd)
        temp[p++] = a[l++];

    while(r <= rightEnd)
        temp[p++] = a[r++];

    for (i = 0; i < num; i++, rightEnd--)
        a[rightEnd] = temp[rightEnd];
}

void msort(int a[],int temp[],int l,int rightEnd) {
    int center;
    if (l < rightEnd) {
        center = (l + rightEnd) / 2;
        msort(a, temp, l, center);
        msort(a, temp, center + 1, rightEnd);
        merge(a, temp, l, center + 1, rightEnd);
    }
}

void mergeSort(int a[], int n) {
    printf("归并排序执行中...\n");
    int *temp = (int *)malloc(n*sizeof(int));
    if(temp) {
        msort(a, temp , 0, n - 1);
        free(temp);
    }
    else
        printf("no space!\n");
}

// 快速排序
// 设定一个基数（i->基数）
// 设定2个变量 i,j i->首位置，j->末尾位置
// i++ 知道找到 比 指向大的数, j-- 找到比基数小的
// i<j 则 i 与 j 交换
// 继续 i>j 则 i 与 基数交换
void quickSort(int a[], int s, int t) {
    int i, j;
    if (s < t) {
        i = s;
        j = t + 1;
        while (1) {
            do i++;
            while (!(a[s] <= a[i]) || i == t);
            do j--;
            while (!(a[s] >= a[j]) || j == s);
            if (i < j) {
                swap(&a[i], &a[j]);
            } else {
                break;
            }
        }
        swap(&a[s], &a[j]);
        quickSort(a, s, j-1);
        quickSort(a, j+1, t);
    }
}











