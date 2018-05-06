---
title: Data Structures and Algorithms DotNet － 2、单向和双向链表
categories:
- Data Structures and Algorithms
tags:
- DotNet
- Data Structures and Algorithms
date: 2013-03-01 16:25:51
---



```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace LinkedList1
{
    class Program
    {
        static void Main(string[] args)
        {
            DoublyLinkedList list = new DoublyLinkedList();
            list.Insert("Hellow","header");
            list.Insert("World", "Hellow");
            list.PrintReverse();
            Console.ReadKey();
        }
    }

    //双向链表(Tow-Way Linked List/doubly linked list)
    class DoublyNode
    {
        public object element;
        public DoublyNode FLink;
        public DoublyNode BLink;

        public DoublyNode()
        {
            element = null;
            FLink = null;
            BLink=null;
        }

        public DoublyNode(object item)
        {
            element = item;
            FLink = null;
            BLink=null;
        }
    }

    class DoublyLinkedList
    {
        protected DoublyNode header;

        public DoublyLinkedList()
        {
            header = new DoublyNode("header");
        }

        private DoublyNode FindCurrent(object item)
        {
            DoublyNode current = new DoublyNode();
            current = header;

            while (current.element != item)
                current = current.FLink;
            return current;
        }

        public void Insert(object item, object after)
        {
            DoublyNode current = new DoublyNode();
            DoublyNode newNode = new DoublyNode(item);

            current = FindCurrent(after);

            newNode.FLink = current.FLink;
            newNode.BLink = current;
            current.FLink = newNode;
        }

        public void Remove(object item)
        {
            DoublyNode current = new DoublyNode();

            current = (DoublyNode)item;

            current.BLink.FLink = current.FLink;
            current.FLink.BLink = current.BLink;
            current.BLink = null;
            current.FLink = null;
        }

        public DoublyNode FindLast()
        {
            DoublyNode current = new DoublyNode();
            current = header;
            while (current.FLink != null)
                current = current.FLink;

            return current;
        }

        public void PrintReverse()
        {
            DoublyNode current = new DoublyNode();
            current = FindLast();

            while (current.BLink != null)
            {
                Console.WriteLine(current.element);
                current = current.BLink;
            }
        }
    }

    //单向链表(One-Way Linked List/Singly linked list)
    class Node
    {
        public object element;
        public Node link;

        public Node()
        {
            element = null;
            link = null;
        }

        public Node(object item)
        {
            element = item;
            link = null;
        }
    }

    class SinglyLikedList
    {
        protected Node header;

        public SinglyLikedList()
        {
            header = new Node("header");
        }

        //查找本项
        private Node FindCurrentLink(object item)
        {
            Node current=new Node();
            current=header;
            while (current.element != item)
                current = current.link;
            return current;
        }

        //查找本项的上一项
        private Node FindPreviousLink(object item)
        {
            Node current = new Node();
            current = header;
            while (current.link != null && current.link.element != item)
                current = current.link;
            return current;
        }

        public void Insert(object item, object after)
        {
            Node current = new Node();
            Node newNode = new Node(item);
            current = FindCurrentLink(after);
            newNode.link = current.link;
            current.link = newNode;
        }

        public void Remove(object item)
        {
            Node node = FindPreviousLink(item);
            if (node.link != null)
                node.link = node.link.link;
        }

        public void PrintList()
        {
            Node current = new Node();
            current = header;

            while (current.link != null)
            {
                Console.WriteLine(current.link.element);
                current = current.link;
            }
        }
    }
}
```

