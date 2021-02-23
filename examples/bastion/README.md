# Bastion Example

Here we use a bastion host, which is in a public subnet, to access a server, which is in a private subnet.

The server only allows an SSH connection from the bastion host.

Before using the SSH commands below, it is very important to reduce the file permissions on all keys with:

```bash
chmod 400 keys/*
```

Move SSH config file command:

```bash
mv ssh/config ~/.ssh/config
```

To connect to the bastion host:

```bash
ssh bastion
```

To connect to the private server:

```bash
ssh server
```