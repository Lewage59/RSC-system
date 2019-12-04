package com.rsc.utils;

public class SortUtil {
    public static void quickSort(int[] arr,int[] arrNumber,int low,int high){
        int i,j,temp,t,a,temp_Number;
        if(low>high){
            return;
        }
        i=low;
        j=high;
        //temp就是基准位
        temp = arr[low];
        temp_Number = arrNumber[low];

        while (i<j) {
            //先看右边，依次往左递减
            while (temp<=arr[j]&&i<j) {
                j--;
            }
            //再看左边，依次往右递增
            while (temp>=arr[i]&&i<j) {
                i++;
            }
            //如果满足条件则交换
            if (i<j) {
                t = arr[j];
                a = arrNumber[j];
                arr[j] = arr[i];
                arrNumber[j] = arrNumber[i];
                arr[i] = t;
                arrNumber[i] = a;
            }

        }
        //最后将基准为与i和j相等位置的数字交换
        arr[low] = arr[i];
        arrNumber[low] = arrNumber[i];
        arr[i] = temp;
        arrNumber[i] = temp_Number;
        //递归调用左半数组
        quickSort(arr,arrNumber, low, j-1);
        //递归调用右半数组
        quickSort(arr,arrNumber,j+1, high);
    }

    public static void findMinPostman(int[] PostmanNumber,int[] PostmanId){
        quickSort(PostmanNumber, PostmanId, 0, PostmanNumber.length-1);
    }
}
