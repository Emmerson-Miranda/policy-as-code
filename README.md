# policy-as-code

Kubernetes Policy as Code PoCs

## Create cluster

Uses KinD terraform´s [provider](./terraform/provider.tf) to create a local cluster.

```bash
terraform -chdir=terraform init
terraform -chdir=terraform plan
terraform -chdir=terraform apply --auto-approve
kind get clusters
```

## Destroy cluster

```bash
terraform -chdir=terraform destroy --auto-approve
kind get clusters
```

## Examples

| Example | Description                                                                             |
|-----|---------------------------------------------------------------------------------------------|
| [01](./kyverno/kyverno-01/readme.md) | Simple Kyverno examples to validate and mutate labels in pods.     |
| [02](./kyverno/kyverno-02/readme.md) | Replicate secrets from default namespace to each new namespace.    |
| [03](./kyverno/kyverno-03/readme.md) | Add SELinux configuration to Pods created by a DaemonSet           |

