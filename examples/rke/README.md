# An RKE cluster on AWS

## RKE EC2

For RKE to create a cluster successfully it requires the EC2 instance to have
the following tag:

```
"kubernetes.io/cluster/[CLUSTER NAME]": "owned"
```

This example demonstrates this.