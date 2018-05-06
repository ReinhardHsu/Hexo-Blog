---
title: Data Structures and Algorithms DotNet － 1、排序和查找
categories:
- Data Structures and Algorithms
tags:
- DotNet
- Data Structures and Algorithms
date: 2013-02-26 16:43:51
---



```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;

namespace ConsoleApplication4
{
    class Program
    {
        static void Main(string[] args)
        {
            int nums = 100;
            CArray mynums = new CArray(nums);
            Random rand = new Random();

            for (int i = 0; i < nums; i++)
            {
                mynums.Insert(rand.Next(100));
            }

            mynums.DisplayElements();

            //mynums.InsertionSort();

            mynums.SeqSearch(50);
            mynums.BinSearch(50);

            mynums.DisplayElements();

            Console.ReadKey();
        }
    }

    class CArray
    {
        private int upper;
        private int numElements;
        private int[] arr;
        private int compCount;

        public CArray(int length)
        {
            upper = length-1;
            arr = new int[length];
            numElements = 0;
        }

        public void Insert(int item)
        {
            arr[numElements] = item;
            numElements += 1;
        }

        public void Clear()
        {
            for (int i = 0; i < upper; i++)
            {
                arr[i] = 0;
            }
            numElements = 0;
        }

        public void DisplayElements()
        {
            StringBuilder str = new StringBuilder();

            for (int i = 0; i <= upper; i++)
            {
                str.AppendFormat("{0}\t", arr[i]);
            }

            Console.Write(str);
        }

        //冒泡排序
        public void BubbleSort()
        {
            int temp;
            for (int outer = upper; outer >= 1; outer--)
            {
                for (int inner = 0; inner < outer-1; inner++)
                {
                    if (arr[inner] > arr[inner + 1])
                    {
                        temp = arr[inner + 1];
                        arr[inner + 1] = arr[inner];
                        arr[inner] = temp;
                    }
                }

                this.DisplayElements();
            }
        }

        //选择排序
        public void SelectionSort()
        {
            int low,temp;
            for (int outer = 0; outer <upper; outer++)
            {
                low = outer;
                for (int inner = outer+1; inner < upper; inner++)
                {
                    if (arr[low] > arr[inner])
                    {
                        low = inner;
                    }
                }
                temp = arr[outer];
                arr[outer] = arr[low];
                arr[low] = temp;

                this.DisplayElements();
            }
        }

        //插入排序
        public void InsertionSort()
        {
            int inner, temp;
            for (int outer =  1; outer <=upper; outer++)
            {
                temp = arr[outer];
                inner=outer;
                while (inner > 0 && temp <= arr[inner - 1])
                {
                    arr[inner] = arr[inner - 1];
                    inner-=1;
                }
                arr[inner] = temp;

                //this.DisplayElements();
            }
        }

        //顺序查找
        public bool SeqSearch(int value)
        {
            int times = 0, last = 0;
            compCount = 0;
            for (int i = 0; i < upper; i++)
            {
                compCount += 1;
                if (arr[i] == value)
                {
                    times+=1;
                    last = i;                    
                    Console.WriteLine("The {0} times index is {1}.", times, i);
                }
            }
            if (times > 0)
            {
                Console.WriteLine("The last index is {0},compCount is {1}.", last,compCount);
                return true;
            }
            else
            {
                Console.WriteLine("None,compCount is {0}.",compCount);
                return false;
            }
        }

        //自定制二叉查找
        public void BinSearch(int value)
        {
            int upperBound, lowerBound, mid;
            upperBound = upper;
            lowerBound = 0;
            compCount = 0;
            while (lowerBound <= upperBound)
            {
                mid = (lowerBound + upperBound) / 2;
                compCount += 1;
                if (arr[mid] == value)
                {
                    Console.Write("{0} 's index is {1},compCount is {2}\n", value, mid,compCount);
                    return;
                }
                else if (value < arr[mid])
                {
                    upperBound = mid - 1;
                }
                else
                {
                    lowerBound = mid + 1;
                }
            }
            Console.Write("{0} 's index is {1},compCount is {2}\n",value, -1,compCount);
        }

        //系统内置二叉查找(比自定制的快)
        public void Bsearch(int value)
        {
            Console.Write("{0} 's index is {1}\n", value, Array.BinarySearch(arr, value));
        }

    }
}
```

