
variable "access_key" {
  type = string
}
variable "secret_key" {
  type = string
}

variable "ami_id" {
  default = "ami-079cd5448deeace01"
}

variable "sg_id" {
  default = ""
}

variable "vpc_id" {
  default = ""
}

variable "subnet_id" {
  default = ""
}

variable "instance_type" {
  default = "t3.small"
}

variable "key_pair" {
  type = string
  default = "net"
}
