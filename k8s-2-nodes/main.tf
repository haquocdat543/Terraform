provider "aws" {
  region     = "ap-northeast-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_network_interface" "Master" {
  subnet_id       = var.subnet_id
  private_ips     = ["172.31.32.5"]
  security_groups = [var.sg_id]
}

resource "aws_network_interface" "Worker" {
  subnet_id       = var.subnet_id
  private_ips     = ["172.31.32.6"]
  security_groups = [var.sg_id]
}

# Assign an elastic IP to the network interface created in step 7

# resource "aws_eip" "Master" {
#   domain                    = "vpc"
# }
# resource "aws_eip" "Worker" {
#   domain                    = "vpc"
# }

# resource "aws_eip_association" "eip_assoc_to_Master" {
#   instance_id   = aws_instance.Master.id
#   allocation_id = aws_eip.Master.id
# }

# resource "aws_eip_association" "eip_assoc_to_Worker" {
#   instance_id   = aws_instance.Worker.id
#   allocation_id = aws_eip.Worker.id
# }

resource "aws_instance" "Master" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  availability_zone = "ap-northeast-1a"
  key_name          = var.key_pair

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.Master.id
  }

  user_data = file("../bash/worker-node-centos.sh")

  tags = {
    "Name" = "Master"
  }
}

resource "aws_instance" "Worker" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  availability_zone = "ap-northeast-1a"
  key_name          = var.key_pair

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.Worker.id
  }

  user_data = file("../bash/worker-node-centos.sh")
  
  tags = {
    "Name" = "Worker"
  }
}
# Output
# If you use centos EC2 linux centos you need to change "ubuntu" to "ec2-user"
output "Master" {
  value = "ssh -i ${var.key_pair}.pem ec2-user@${aws_instance.Master.public_ip}"
}
output "Worker" {
  value = "ssh -i ${var.key_pair}.pem ec2-user@${aws_instance.Worker.public_ip}"
}
