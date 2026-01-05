resource "aws_instance" "lifecycle" {
  ami           =  "ami-09c813fb71547fc4f"
  instance_type =  "t3.micro"
  vpc_security_group_ids = [aws_security_group.lifecycle.id]

  tags = {
    Name = "terraform"
    terraform = true 

  }

  # lifecycle {
  #   prevent_destroy = true
  # }
}

resource "aws_instance" "another" {
  ami           =  "ami-09c813fb71547fc4f"
  instance_type =  "t3.micro"
  tags = {
    Name = "terraform"
    terraform = true 

  }

  # lifecycle {
  #   prevent_destroy = true
  # }
}

resource "aws_security_group" "lifecycle" {
  name = "lifecycle"
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
    Name = "lifecycle"
  }
  # lifecycle {
  #   create_before_destroy = true
  #   prevent_destroy = true
  # }
}