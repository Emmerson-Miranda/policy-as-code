# kyverno 

Kyverno, is [already installed using terraform](./../terraform/main.tf), alternatively you can run below script.

```bash
helm repo add kyverno https://kyverno.github.io/kyverno/
helm repo update
helm install kyverno kyverno/kyverno -n kyverno --create-namespace
```

## Examples

| Example | Description                                                                             |
|-----|---------------------------------------------------------------------------------------------|
| [01](./kyverno-01/readme.md) | Simple Kyverno examples to validate and mutate labels in pods.     |
| [02](./kyverno-02/readme.md) | Replicate secrets from default namespace to each new namespace.    |
| [03](./kyverno-03/readme.md) | Add SELinux configuration to Pods created by a DaemonSet           |