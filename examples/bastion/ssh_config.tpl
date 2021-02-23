# This file should be moved to: ~/.ssh
# Keys should have file permissions reduced with: chmod 400 keys/*

# This alias, can be used with: ssh bastion
HOST bastion
  IdentityFile ${bastion_pem}
  User ${bastion_user}
  Hostname ${bastion_public_ip}  

# This alias, can be used with: ssh server  
HOST server
  IdentityFile ${server_pem}
  User ${server_user}
  Hostname ${server_private_ip}
  ProxyCommand ssh bastion -W %h:%p