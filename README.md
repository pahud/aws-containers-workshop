# aws-containers-workshop

This repo aims to help you build a 3-tier e-commerce microservices on **AWS Fargate** and/or **Amazon EKS**.

The architecture containers 3 micro services:

1. **Order** - public-facing API for ticket ordering
2. **Ticket** - order orchistration and processing
3. **CMS** - customer system



## Lab 1 - All-In AWS 

[Start the Lab](lab1/README.md)



![](images/lab1-all-in-fargate.png)



## Lab 2 - All-In Amazon EKS

[Start the Lab](lab2/README.md)

![](images/lab1-all-in-eks-clb-alb.png)



![](images/lab2-all-in-eks-single-external-alb.png)



![](images/lab2-hybrid-fargate-eks.png)