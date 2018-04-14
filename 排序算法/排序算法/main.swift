//
//  main.swift
//  排序算法
//
//  Created by bcmac3 on 16/9/21.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

import Foundation
/**
for i in 0...3 {
    print(i)
}

for i in 3.stride(through: 0, by: -1) { // 包括0
    print(i)
}
 
for i in 3.stride(to: 0, by: -1) { // 不包括0
 print(i)
}

for i in (0...3).reverse() {
    print(i)
}
*/

//var arr = [3,44,38,5,47,15,80,26,27,2,46,4,19,18,48];
//var arr = [1,2,3,4,5,6,8,9,10,12,33,44,12]
var arr = [10,2,3,43,5,64,7,82,9,14,11,32,23,44,15];

print("1-普通冒泡算法")
func bubbleSort(_ arr: [Int]) -> [Int]  {
    let startDate = Date()
    let len = arr.count;
    var nums = arr
    for i in 0..<len {
        for j in 0..<len-1-i {
            if nums[j] > nums[j+1] {
                let temp =  nums[j+1];
                nums[j+1] = nums[j];
                nums[j] = temp;
            }
        }
    }
    let stopDate = Date()
    print(stopDate.timeIntervalSince(startDate))
    return nums;
}
print(bubbleSort(arr));

print("1.1-改进冒泡算法1")
func bubbleSort2(_ arr: [Int]) -> [Int] {
    let startDate = Date()
    var nums = arr;
    var i = arr.count-1;
    while i > 0 {
        var pos = 0
        for j in 0..<i {
            if nums[j] > nums[j+1] {
                let temp =  nums[j+1]
                nums[j+1] = nums[j]
                nums[j] = temp
                pos = j
            }
            i = pos
        }
    }
    let stopDate = Date()
    print(stopDate.timeIntervalSince(startDate))
    return nums;
}
print(bubbleSort2(arr));

print("1.2-改进冒泡算法2")
func bubbleSort3(_ arr: [Int]) -> [Int] {
    let startDate = Date()
    var nums = arr;

    var low = 0
    var high = nums.count - 1
    var temp = 0

    while low < high {
        var low_pos = 0
        var high_pos = 0
        for j in low..<high {
            if nums[j] > nums[j+1] {
                temp =  nums[j+1]
                nums[j+1] = nums[j]
                nums[j] = temp
                high_pos = j
            }
        }
        high = high_pos

        for k in stride(from: high, to: low, by: -1) {
            if nums[k] < nums[k-1] {
                temp =  nums[k-1]
                nums[k-1] = nums[k]
                nums[k] = temp
                low_pos = k
            }
        }
        low = low_pos;
    }

    let stopDate = Date()
    print(stopDate.timeIntervalSince(startDate))
    return nums;
}
print(bubbleSort3(arr));


print("2-选择排序")
func selectionSort(_ arr: [Int]) -> [Int] {
    let startDate = Date()
    var nums = arr

    let len = nums.count
    var minIndex = 0
    var temp = 0

    for i in 0..<len-1 {
        minIndex = i
        for j in i+1..<len {
            if nums[j] < nums[minIndex] {
                minIndex = j
            }
        }
        temp = nums[i]
        nums[i] = nums[minIndex]
        nums[minIndex] = temp
    }
    let stopDate = Date()
    print(stopDate.timeIntervalSince(startDate))
    return nums
}
print(selectionSort(arr));

print("3-插入排序算法")
func insertSort(_ arr: [Int]) -> [Int] {
    let startDate = Date()
    var nums = arr
    let len = nums.count

    for i in 1..<len {
        let key = arr[i]
        var j = i-1
        while j>=0 && nums[j] > key {
            nums[j+1] = nums[j]
            j-=1
        }
        nums[j+1] = key
    }

    let stopDate = Date()
    print(stopDate.timeIntervalSince(startDate))
    return nums
}
print(insertSort(arr))

print("3.1-使用二分查找位置")
func insertSort2(_ arr: [Int]) -> [Int] {
    let startDate = Date()
    var nums = arr
    let len = nums.count

    for i in 1..<len {
        let key = nums[i]
        var left = 0, right = i - 1;
        while left <= right {
            let middle = Int((left+right)/2)
            if key < nums[middle] {
                right = middle - 1;
            } else {
                left = middle + 1;
            }
        }
        for j in stride(from: (i-1), through: left, by: -1) {
            nums[j + 1] = nums[j];
        }
        nums[left] = key;

    }

    let stopDate = Date()
    print(stopDate.timeIntervalSince(startDate))
    return nums
}
print(insertSort2(arr))

/**
 let startDate = NSDate()
 var nums = arr
 let len = nums.count

 let stopDate = NSDate()
 print(stopDate.timeIntervalSinceDate(startDate))
 return nums
 */

print("排序")

print("2^n次方算法设计-有待完善")
// 群里说有个面试题是这个，所以试着想了一下

func sypow(x: Float, n: Int) -> Float {
    if n == 0 {return 1.0;}
    if n == 1 {return x;}
    if n % 2 == 0 {
        return sypow(x: x*x, n: n/2)
    } else {
        return sypow(x: x*x, n: n/2) * x
    }
}

print(sypow(x: 2,n: 10))


print("3.1-使用二分查找位置2")
func insertSort3(_ arr: [Int]) -> [Int] {
    let startDate = Date()
    var nums = arr
    let len = nums.count
    
    for i in 1..<len {
        let key = nums[i]
        var left = 0, right = i - 1;
        while left <= right {
            let middle = Int((left+right)/2)
            if key < nums[middle] {
                right = middle - 1;
            } else {
                left = middle + 1;
            }
        }
        for j in stride(from: (i-1), through: left, by: -1) {
            nums[j + 1] = nums[j];
        }
        nums[left] = key;
    }
    
    let stopDate = Date()
    print(stopDate.timeIntervalSince(startDate))
    return nums
}
print(insertSort2(arr))


func checkAbnormal1(_ arr: [Int], checkNum: Int, maxCount: Int, startIndex: inout Int, keyNums: inout [Int:Int]) -> Bool {
    print("=======================\ncheckAbnormal1\n")
    let startDate = Date()
    
    for i in startIndex..<arr.count {
        let num = arr[i];
        if (keyNums[num] != nil) {
            let count = keyNums[num]!
            keyNums[num] = count+1
        } else {
            keyNums[num] = 1
        }
    }
    
    let stopDate = Date()
    print("耗时 \(stopDate.timeIntervalSince(startDate))")
    
    if keyNums[checkNum] == nil {
        print("暂时没有统计到该数")
        return false
    }
    
    if keyNums[checkNum]! > maxCount {
        return true
    }
    
    return false
}

var nums = [1,2,5,2,4,3,1,7,6,4,3,2]
var keyNums = [Int:Int]()
var startIndex = 0
let maxCount = 2

print("2是否异常 \(checkAbnormal1(nums, checkNum: 2, maxCount: 2, startIndex: &startIndex, keyNums: &keyNums))")
print("3是否异常 \(checkAbnormal1(nums, checkNum: 3, maxCount: 2, startIndex: &startIndex, keyNums: &keyNums))")


func checkAbnormal2(_ arr: [Int], checkNum: Int, maxCount: Int) -> Bool {
    print("=======================\ncheckAbnormal2\n")
    let startDate = Date()
    
    
    
    return false
}






