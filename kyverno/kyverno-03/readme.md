# kyverno 03

Basic example of how to mutate a pod resource to add SELinux policy.

Based on https://kyverno.io/docs/writing-policies/mutate/

Pre requisites: [Install Kyverno](../readme.md)


## 1 - Create Policy

```bash
kubectl apply -f policy-set-seLinuxOptions.yaml
```

## 2 - Deploy DaemonSet
Kyverno will modify Security context of the Pod generated by the DS.

```bash
kubectl apply -f deploy-daemonset.yaml
```

## 3 - Test the policy

```bash
kubectl get po -o yaml | grep -i seLinuxOptions -A 1 -B 1
```
Output
```bash
      securityContext:
        seLinuxOptions:
          level: s0:c123,c456
```