terraform {
  cloud {
    organization = "jadonharsh"

    workspaces {
      name = "GitOps-Master-Actions"
    }
  }
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

resource "aws_instance" "staging-instance" {
  ami                    = var.ami_id
  instance_type          = "t2.large"
  key_name               = var.key_name
  vpc_security_group_ids = [var.vpc_security_group]
  tags = {
    "Name" = var.instance_name
  }

  connection {
    host        = self.public_ip
    user        = "ubuntu"
    type        = "ssh"
    private_key = var.private_key
  }

  provisioner "remote-exec" {
    script = "./docker-setup.sh"
  }
}



output "Public_IP" {
  value = aws_instance.staging-instance.public_dns
}


