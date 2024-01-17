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
  region     = "us-east-1"
}

resource "aws_instance" "${var.instance_name}" {
  ami                    = var.ami_id
  instance_type          = "t2.micro"
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
    script = "./requirement.sh"
  }
}



output "Public_IP" {
  value = aws_instance.first-instance.public_dns
}


