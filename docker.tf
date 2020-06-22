#      _____             _
#     |  __ \           | |
#     | |  | | ___   ___| | _____ _ __
#     | |  | |/ _ \ / __| |/ / _ \ '__|
#     | |__| | (_) | (__|   <  __/ |
#     |_____/ \___/ \___|_|\_\___|_|

# https://www.terraform.io/docs/providers/null/resource.html

resource "null_resource" "install-docker" {

  count = var.docker ? 1 : 0

  depends_on = [
    null_resource.get-shared-scripts,
    aws_instance.this
  ]

  connection {
    type        = "ssh"
    host        = aws_instance.this.public_ip
    user        = "ubuntu"
    private_key = module.keys.private_key
  }

  # https://www.terraform.io/docs/provisioners/file.html

  provisioner "file" {
    source      = "${path.cwd}/${local.shared_scripts_folder}/docker/install_docker.sh"
    destination = "install_docker.sh"
  }

  # https://www.terraform.io/docs/provisioners/remote-exec.html

  provisioner "remote-exec" {
    inline = ["chmod +x install_docker.sh && bash install_docker.sh"]
  }

}

# https://www.terraform.io/docs/providers/null/resource.html

resource "null_resource" "is-docker-ready" {

  count = var.docker ? 1 : 0

  depends_on = [
    null_resource.get-shared-scripts,
    null_resource.install-docker
  ]

  connection {
    type        = "ssh"
    host        = aws_instance.this.public_ip
    user        = "ubuntu"
    private_key = module.keys.private_key
  }

  # https://www.terraform.io/docs/provisioners/file.html

  provisioner "file" {
    source      = "${path.cwd}/${local.shared_scripts_folder}/docker/is_docker_ready.sh"
    destination = "is_docker_ready.sh"
  }

  # https://www.terraform.io/docs/provisioners/remote-exec.html

  provisioner "remote-exec" {
    inline = ["chmod +x is_docker_ready.sh && bash is_docker_ready.sh"]
  }

}