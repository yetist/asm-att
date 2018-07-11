#! /usr/bin/env python
# -*- encoding:utf-8 -*-
# FileName: quicksort.py

def quickSort(arr,low,high):
    if low < high:
        # pi is partitioning index, arr[p] is now
        # at right place
        pi = partition(arr,low,high)
        print(pi)
        # Separately sort elements before
        # partition and after partition
        quickSort(arr, low, pi-1)
        quickSort(arr, pi+1, high)

def partition(arr,low,high):
    i = (low-1)
    # index of smaller element
    pivot = arr[high]
    # pivot
    for j in range(low, high):
        # If current element is smaller than or
        # equal to pivot
        if arr[j] <= pivot:
            # increment index of smaller element
            i = i+1
            arr[i],arr[j] = arr[j],arr[i]
    arr[i+1],arr[high] = arr[high],arr[i+1]
    return(i+1)

if __name__=="__main__":
    testarray = [5,1,3,7,8,10,6]
    print(testarray)
    quickSort(testarray, 0, 6)
    print(testarray)
