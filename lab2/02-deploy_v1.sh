kubectl apply -f k8s/product/v1/app-vanilla.yaml
kubectl apply -f k8s/customer/v1/app-vanilly.yaml
kubectl apply -f k8s/order/v1/app-vanilla.yaml
kubectl get svc,deploy,pod