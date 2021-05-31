resource "aws_security_group" "nat_instance" {
  name   = "nat-instance-sg"
  vpc_id = aws_vpc.main.id
}

resource "aws_security_group_rule" "ingress_nat_instance_ssh" {
  count = var.allow_ssh_port ? 1 : 0

  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "TCP"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.nat_instance.id
}

resource "aws_security_group_rule" "ingress_nat_instance_from_private_subnet" {
  type        = "ingress"
  from_port   = 0
  to_port     = 65535
  protocol    = "-1"
  cidr_blocks = [aws_subnet.private.cidr_block]

  security_group_id = aws_security_group.nat_instance.id
}

resource "aws_security_group_rule" "egress_nat_instance" {
  count = var.allow_ssh_port ? 1 : 0

  type        = "egress"
  from_port   = 0
  to_port     = 65535
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.nat_instance.id
}
