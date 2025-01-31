[text](../argocd/resources)# policy-as-code

Kubernetes Policy as Code PoCs

## Create cluster

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
| [01](./kyverno/kyverno-01/readme.md) | Simple Kyverno examples to validate and mutate pods.       |

