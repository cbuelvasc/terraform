# Deploy Minikube

[Tutorial Minikube - Terraform](https://vaibhavji.medium.com/deploy-kubernetes-resources-in-minikube-cluster-using-terraform-8dde6dd72bc4)

### List namespace terraform
```bash
$ kubectl get ns terraform
```

### View deployments
```bash
$ kubectl get deployment -n terraform
```

### Get the deployed pods
```bash
$ kubectl get pods -n terraform
```

### Get url acces to app througth service
```bash
$ minikube service terraform-service -n terraform
```