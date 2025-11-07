resource "aws_instance" "terraform" {
  count = 4
  ami           =  "ami-09c813fb71547fc4f"
  instance_type =  "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow-all.id]

  tags = {
    Name = var.instances[count.index]
    terraform = true
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