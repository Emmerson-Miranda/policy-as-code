# kyverno 

Installing kyverno

```bash
helm repo add kyverno https://kyverno.github.io/kyverno/
helm repo update
helm install kyverno kyverno/kyverno -n kyverno --create-namespace
```

## Examples

| Example | Description                                                                             |
|-----|---------------------------------------------------------------------------------------------|
| [01](./kyverno-01/readme.md) | Simple Kyverno examples to validate and mutate pods.       |