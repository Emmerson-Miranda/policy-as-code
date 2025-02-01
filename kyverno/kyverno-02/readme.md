# kyverno 01

Basic example of how to Generate resources.
This create a secret in default namespace and replicate it in all new namespaces created.

Based on https://kyverno.io/docs/introduction/quick-start/

Pre requisites: [Install Kyverno](../readme.md)


## 1 - Create secret to be replicated

```bash
kubectl apply -f deploy-secret.yaml
```

## 2 - Deploy Cluster Roles
Kyverno needs this to be able to access secrets because by default it cannot.

```bash
kubectl apply -f deploy-kyverno-roles.yaml
```

## 3 - Install generate policy

```bash
kubectl apply -f policy-sync-secrets.yaml
```

## 4 - Test the policy

```bash
kubectl create ns mytestns
kubectl -n mytestns get secret
```
Output
```bash
NAME      TYPE                             DATA   AGE
regcred   kubernetes.io/dockerconfigjson   1      8s
```