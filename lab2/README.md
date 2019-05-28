# Lab 2 - Running Services in Amazon EKS

## Create cluster with eksctl

```bash
# download and install eksctl from eksctl.io 
$ curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
$ sudo mv /tmp/eksctl /usr/local/bin
$ eksctl version 
[ℹ]  version.Info{BuiltAt:"", GitCommit:"", GitTag:"0.1.32"}
# create Amazon EKS cluster with eksctl
$ export AWS_REGION=ap-northeast-1
$ eksctl create cluster --name myeks
# (this may take up to 15min)
# get the nodes
$ kubectl get no
NAME                                                STATUS   ROLES    AGE     VERSION
ip-192-168-5-238.ap-northeast-1.compute.internal    Ready    <none>   3m32s   v1.12.7
ip-192-168-92-162.ap-northeast-1.compute.internal   Ready    <none>   3m29s   v1.12.7
```

create k8s services

```bash
# deploy the services in Amazon EKS
$ bash 02-deploy_v1.sh
# check the ELB dns name of order service
$ kubectl  get svc/order
NAME    TYPE           CLUSTER-IP     EXTERNAL-IP                                                                   PORT(S)        AGE
order   LoadBalancer   10.100.50.51   a98c44c72809711e995940a063a6e1fe-571914798.ap-northeast-1.elb.amazonaws.com   80:32508/TCP   14m
# curl the order service ELB endpoint
$ curl a98c44c72809711e995940a063a6e1fe-571914798.ap-northeast-1.elb.amazonaws.com
{"service":"Order", "version":"1.0"}
{"service":"Customer","version":"1.0"}
{"service":"Product","version":"1.0"}
```
