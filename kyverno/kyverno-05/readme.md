# kyverno 05

Blocks updates and deletes on resources of type `Services`.

Based on https://kyverno.io/policies/other/block-updates-deletes/block-updates-deletes/

Pre requisites: [Install Kyverno](../readme.md)

## 1 - Create Namespace

```bash
kubectl create ns blocks
kubectl config set-context --current --namespace=blocks
```

## 2 - Create Policy 

```bash
kubectl apply -f block-updates-deletes.yaml
```

## 3 - Create a service

```bash
kubectl run nginx-pod --image=nginx --restart=Never --port=80 

kubectl expose pod nginx-pod --type=NodePort --port=80 --name=nginx-service --labels='protected=true'

kubectl expose pod nginx-pod --type=NodePort --port=80 --name=nginx-service-unprotected 
```

## 4 - Delete the un-protected service

```bash
kubectl delete svc nginx-service-unprotected
```
Output:
```Text
service "nginx-service-unprotected" deleted
```


## 5 - Delete the protected service

```bash
kubectl delete svc nginx-service
```
Output:
```Text
Error from server: admission webhook "validate.kyverno.svc-fail" denied the request: 

resource Service/blocks/nginx-service was blocked due to the following policies 

block-updates-deletes:
  block-updates-deletes-service: This resource is protected and changes are not allowed.
    Please disable this policy first.
```

