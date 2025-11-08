resource "aws_security_group" "roboshop-instances" {
  name = "roboshop-strict-sg"

  egress {
    from_port        = 0  # from 0 to , to 0 means all ports
    to_port          = 0
    protocol         = "-1"  # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"]
  }

  dynamic "ingress" {
    for_each = toset(var.ingress_ports)
    content {
      from_port   = ingress.value  # here ingress is special keyword
      to_port     = ingress.value
      protocol    = "tcp"  # enter only specified ports what we give
      cidr_blocks = ["0.0.0.0/0"]
    }
  } 

  tags = {
    Name = "roboshop-strict-sg"
  }
}