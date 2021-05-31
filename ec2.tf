resource "aws_instance" "nat_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.nat_instance_instance_type
  key_name      = var.key_name

  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = concat(var.nat_instance_security_groups, var.allow_ssh_port ? [aws_security_group.nat_instance.id] : [])
  source_dest_check      = false # disable an aws capability that doesn't allow nat instance to work

  user_data_base64 = data.cloudinit_config.nat_instance.rendered

  root_block_device {
    volume_size = var.nat_instance_volume_size
  }

  tags = {
    "Name" = var.nat_instance_name
  }
}
