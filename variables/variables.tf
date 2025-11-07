variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
  
}

variable "ec2_tags" {
    type = map
    default = {
    Name = "terraform-demo"
    terraform = "true"
    Environment = "dev"
    project = "devops"
  }
  
}
variable "sg_name" {
    type = string
    default = "allow-all"
  
}
variable "egress_from_port" {
    default = 0
  
}
variable "egress_to_port" {
    default = 0
  
}
variable "ingress_from_port" {
    default = 0
  
}
variable "ingress_to_port" {
    default = 0
  
}
variable "protocol" {
    default = "-1"
  
}
variable "cidr" {
    default = ["0.0.0.0/0"]
  
}