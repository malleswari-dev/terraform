resource "aws_instance" "terraform" {
  ami           =  local.ami_id
  instance_type =  local.instance_type
  vpc_security_group_ids = [aws_security_group.allow-all.id]

  tags = local.ec2_tags 
}

resource "aws_security_group" "allow-all" {
  name = "${local.common_name}-allow-all"
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

  tags =merge(
    var.common_tags,
    {
      Name = "${local.common_name}-allow-all"
    }
  )
}