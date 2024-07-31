# EKS Role Test

Dependency with a existing EKS Cluster created before this Role.

```sh
tofu plan -var cluster_name=<my-cluster> 
tofu apply -var cluster_name=<my-cluster> 
```
