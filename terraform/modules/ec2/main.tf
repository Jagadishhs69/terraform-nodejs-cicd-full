
resource "aws_instance" "app" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  associate_public_ip_address = true
  user_data              = file("${path.module}/user_data.sh")
  iam_instance_profile   = var.iam_instance_profile

  tags = {
    Name = "${var.name}-ec2"
  }
}

resource "aws_security_group" "ec2_sg" {
  name        = "${var.name}-ec2-sg"
  vpc_id      = var.vpc_id
  description = "Allow SSH and HTTP"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
