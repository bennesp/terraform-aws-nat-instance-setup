output "vpc_id" {
  value = aws_vpc.main.id
  description = "ID of the main VPC created"
}

output "public_subnet_id" {
  value = aws_subnet.public.id
  description = "ID of the public subnet created"
}

output "private_subnet_id" {
  value = aws_subnet.private.id
  description = "ID of the private subnet created"
}

output "nat_instance_public_ip" {
  value = aws_instance.nat_instance.public_ip
  description = "Public IP assigned to the nat instance"
}
