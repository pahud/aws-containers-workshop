#!/bin/sh

# enable alb ingress controller

# wget https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.1.2/docs/examples/alb-ingress-controller.yaml
# wget https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.1.2/docs/examples/rbac-role.yaml


kubectl apply -f k8s/alb-ingress/rbac-role.yaml
kubectl apply -f k8s/alb-ingress/alb-ingress-controller.yaml

# kubectl logs -n kube-system $(kubectl get po -n kube-system | egrep -o alb-ingress[a-zA-Z0-9-]+)

aws iam put-role-policy --role-name eksctl-myeks-nodegroup-ng-20b8dba-NodeInstanceRole-WTM6EY7GNNB --policy-name alb-ingress-extra --policy-document file://iam-policy.json
