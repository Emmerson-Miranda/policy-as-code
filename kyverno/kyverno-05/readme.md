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


## 6 - Get reports

```bash
kubectl get polr d1aaf6e8-9151-4d81-b4d7-e805b286a3e3 -o yaml
```
Output:
```yaml
apiVersion: wgpolicyk8s.io/v1alpha2
kind: PolicyReport
metadata:
  creationTimestamp: "2025-02-18T23:22:05Z"
  generation: 1
  labels:
    app.kubernetes.io/managed-by: kyverno
  name: d1aaf6e8-9151-4d81-b4d7-e805b286a3e3
  namespace: blocks
  ownerReferences:
  - apiVersion: v1
    kind: Service
    name: nginx-service
    uid: d1aaf6e8-9151-4d81-b4d7-e805b286a3e3
  resourceVersion: "7237"
  uid: bdc6c981-8f34-4a18-8fe6-e7f4e18cb4e3
results:
- category: Sample
  message: validation rule 'block-updates-deletes-service' passed.
  policy: block-updates-deletes
  result: pass
  rule: block-updates-deletes-service
  scored: true
  source: kyverno
  timestamp:
    nanos: 0
    seconds: 1739920905
scope:
  apiVersion: v1
  kind: Service
  name: nginx-service
  namespace: blocks
  uid: d1aaf6e8-9151-4d81-b4d7-e805b286a3e3
summary:
  error: 0
  fail: 0
  pass: 1
  skip: 0
  warn: 0
```

