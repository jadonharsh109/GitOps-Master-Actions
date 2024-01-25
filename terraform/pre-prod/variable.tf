variable "access_key" {
  type = string
}
variable "secret_key" {
  type = string
}
variable "region" {
  type    = string
  default = "us-east-1"
}
variable "instance_name" {
  type = string
}
variable "vpc_security_group" {
  type    = string
  default = "sg-0c18883a4ffb99028"
}
variable "key_name" {
  type    = string
  default = "aws"
}
variable "ami_id" {
  type    = string
  default = "ami-0c7217cdde317cfec"
}
variable "private_key" {
  type = string
}
