# kyverno 04

Basic example of how to mutate a pod resource to add SELinux policy.
This example use `Policy` instead `ClusterPolicy` as well as filter by labels.

Based on https://kyverno.io/docs/writing-policies/mutate/

Pre requisites: [Install Kyverno](../readme.md)

## 1 - Create Namespace

```bash
kubectl create ns uat
kubectl config set-context --current --namespace=uat
```

## 2 - Create Policy and Deploy DaemonSet

```bash
kubectl apply -f policy-set-seLinuxOptions-redis.yaml
kubectl apply -f deploy-redis-daemonset.yaml
kubectl apply -f deploy-nginx-daemonset.yaml
```

## 3 - Verify only Redis pod have seLinux configured

```bash
kubectl get po -l name=nginx -o yaml | grep seLinuxOptions -A1 -B1
kubectl get po -l name=redis -o yaml | grep seLinuxOptions -A1 -B1
```
Output for Redis
```bash
      securityContext:
        seLinuxOptions:
          level: s0:c123,c456
```
