# kyverno 01

Based on https://kyverno.io/docs/introduction/quick-start/

## Install validation policy

```bash
kubectl apply -f policy-required-labels.yaml 
```

Deploy with failure because is not compliant with the policy

```bash
kubectl apply -f deploy-non-compliant.yaml
```
Output
```bash
Error from server: error when creating "deploy-non-compliant.yaml": admission webhook "validate.kyverno.svc-fail" denied the request: 

resource Deployment/default/nginx was blocked due to the following policies 

require-labels:
  autogen-check-team: 'validation error: label ''team'' is required. rule autogen-check-team
    failed at path /spec/template/metadata/labels/team/'
```

Deploy compliant with the policy

```bash
kubectl apply -f deploy-compliant.yaml
```

See Policy reports (wait few minutes to show up)

```bash
kubectl get policyreport -o wide 
```
Output
```bash
NAME                                   KIND         NAME                   PASS   FAIL   WARN   ERROR   SKIP   AGE
55210505-daef-44f6-9de0-879a21e10cf7   Pod          nginx-bc4ffb56-bhh2b   1      0      0      0       0      3m52s
d95e15f0-54ce-4a48-a885-6d546c3e3ebd   Deployment   nginx                  2      0      0      0       0      3m54s
ef26a29b-aa18-4711-b6f4-59a95238619a   ReplicaSet   nginx-bc4ffb56         1      0      0      0       0      3m32s
```

## Install mutating policy

```bash
kubectl apply -f policy-add-labels.yaml 
```

Deploying Redis

```bash
kubectl apply -f deploy-redis.yaml 
```

Verifyinf the label(mylabel) is present (only on the new deployment)

```bash
kubectl get po --show-labels
```
Output
```bash
NAME                     READY   STATUS    RESTARTS   AGE     LABELS
nginx-5656df55b5-xgtl5   1/1     Running   0          9m11s   app=nginx,pod-template-hash=5656df55b5,team=compliant
redis-76c4cfcd74-mrft5   1/1     Running   0          13s     app=redis,mylabel=some.value,pod-template-hash=76c4cfcd74,team=compliant.with.mutating
```
