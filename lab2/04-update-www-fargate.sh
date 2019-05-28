#!/bin/sh

# create public ALB 
$ fargate lb create lb-www-pub --port http:80 --subnet-id subnet-0ed1936ca2b2114aa,subnet-014febb5f9ed099ac,subnet-09831a74212e89546 --security-group-id sg-03f8a3ba54d8d750c

# create it again
$ fargate service create www --lb lb-www-pub --image pahud/aws-container-workshop-service:order-latest \
--port http:8080 \
--env SERVICENAME=www-fg \
--env VERSIONNUM=1.0 \
-e PRODUCT_SVC_URL=http://ticket.demo.local \
-e CUSTOMER_SVC_URL=http://cms.demo.local \
--subnet-id subnet-0ed1936ca2b2114aa,subnet-014febb5f9ed099ac,subnet-09831a74212e89546 \
--security-group-id sg-0220320ba5fd85100
