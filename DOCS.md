## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 0.15.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.42.0 |
| <a name="requirement_cloudinit"></a> [cloudinit](#requirement\_cloudinit) | >= 2.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.42.0 |
| <a name="provider_cloudinit"></a> [cloudinit](#provider\_cloudinit) | >= 2.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.nat_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_route.default_to_igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.default_to_nat_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.nat_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.egress_nat_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress_nat_instance_from_private_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ingress_nat_instance_ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [cloudinit_config.nat_instance](https://registry.terraform.io/providers/hashicorp/cloudinit/latest/docs/data-sources/config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | CIDR block for the VPC created. Muat be at least /16 or /less. Example: 10.0.0.0/16 or 172.0.0.0/8 | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Name of the ssh key pair to use to access the nat instance | `string` | n/a | yes |
| <a name="input_nat_instance_instance_type"></a> [nat\_instance\_instance\_type](#input\_nat\_instance\_instance\_type) | Instance type of the nat-instance ec2 machine. Example: t3a.micro | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the vpc that will be created | `string` | n/a | yes |
| <a name="input_allow_ssh_port"></a> [allow\_ssh\_port](#input\_allow\_ssh\_port) | If true, a security group for port 22 is created | `bool` | `true` | no |
| <a name="input_cloud_init_config"></a> [cloud\_init\_config](#input\_cloud\_init\_config) | Content of a text/cloud-config, used to perform some operations when the machine is created. More info here: https://cloudinit.readthedocs.io/en/latest/topics/modules.html | `string` | `""` | no |
| <a name="input_nat_instance_name"></a> [nat\_instance\_name](#input\_nat\_instance\_name) | Name to give to the nat-instance EC2 machine. Default to nat-instance | `string` | `"nat-instance"` | no |
| <a name="input_nat_instance_security_groups"></a> [nat\_instance\_security\_groups](#input\_nat\_instance\_security\_groups) | List of security groups IDs to attach to the nat instance. A rule for ssh is already present and you shouldn't add a rule for it | `list(string)` | `[]` | no |
| <a name="input_nat_instance_volume_size"></a> [nat\_instance\_volume\_size](#input\_nat\_instance\_volume\_size) | Size of the disk of the nat instance, in GiB. Default: 8 | `number` | `8` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nat_instance_public_ip"></a> [nat\_instance\_public\_ip](#output\_nat\_instance\_public\_ip) | Public IP assigned to the nat instance |
| <a name="output_private_subnet_id"></a> [private\_subnet\_id](#output\_private\_subnet\_id) | ID of the private subnet created |
| <a name="output_public_subnet_id"></a> [public\_subnet\_id](#output\_public\_subnet\_id) | ID of the public subnet created |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | ID of the main VPC created |
