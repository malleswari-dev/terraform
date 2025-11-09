resource "aws_instance" "terraform" {
  ami           =  "ami-09c813fb71547fc4f"
  instance_type =  "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow-all.id]

  tags = {
    Name = "terraform"
    terraform = true
  }
  provisioner "local-exec"{
    command = "echo ${self.private_ip} > inventory"
    on_failure = continue
  }

  provisioner "local-exec"{
    command = "echo Instance is destroyed"
    when    = destroy
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    host = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
        "sudo dnf install nginx -y",
        "sudo systemctl start nginx"
    ]
  }

  provisioner "remote-exec" {
    inline = [
        "sudo systemctl stop nginx",
        "echo 'successfully stoped nginx server'"
    ]
    when = destroy
  }  


}

resource "aws_security_group" "allow-all" {
  name = "allow-all"
  egress {
    from_port        = 0  # from 0 to , to 0 means all ports
    to_port          = 0
    protocol         = "-1"  # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 0 
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-all"
  }
}