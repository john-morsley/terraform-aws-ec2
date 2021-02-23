# An RKE cluster on AWS

## RKE EC2

For RKE to create a cluster successfully it requires the EC2 instance to have
the following tag:

```
"kubernetes.io/cluster/[CLUSTER NAME]": "owned"
```

In fact, the VPC, the security groups and the subnets must also be tagged as above.

This example demonstrates this.

This example can also be used when using the rke binary locally.

Please refer to the following article: https://rancher.com/blog/2018/2018-05-14-rke-on-aws/

