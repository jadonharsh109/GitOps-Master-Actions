terraform {
  cloud {
    organization = "jadonharsh"

    workspaces {
      name = "GitOps-Master-Actions-Pre-Prod"
    }
  }
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

resource "aws_instance" "pre-prod" {
  ami                    = var.ami_id
  instance_type          = "t2.large"
  key_name               = var.key_name
  vpc_security_group_ids = [var.vpc_security_group]
  tags = {
    "Name" = "pre-prod"
  }

  connection {
    host        = self.public_ip
    user        = "ubuntu"
    type        = "ssh"
    private_key = var.private_key
  }

  provisioner "remote-exec" {
    script = "./requirement.sh"
  }
}

output "Public_IP" {
  value = aws_instance.first-instance.public_dns
}


