variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC created. Muat be at least /16 or /less. Example: 10.0.0.0/16 or 172.0.0.0/8"
}

variable "vpc_name" {
  type        = string
  description = "Name of the vpc that will be created"
}

variable "nat_instance_instance_type" {
  type        = string
  description = "Instance type of the nat-instance ec2 machine. Example: t3a.micro"
}

variable "key_name" {
  type        = string
  description = "Name of the ssh key pair to use to access the nat instance"
}

variable "nat_instance_name" {
  type        = string
  description = "Name to give to the nat-instance EC2 machine. Default to nat-instance"
  default     = "nat-instance"
}

variable "nat_instance_security_groups" {
  type        = list(string)
  description = "List of security groups IDs to attach to the nat instance. A rule for ssh is already present and you shouldn't add a rule for it"
  default     = []
}

variable "allow_ssh_port" {
  type        = bool
  description = "If true, a security group for port 22 is created"
  default     = true
}

variable "nat_instance_volume_size" {
  type        = number
  description = "Size of the disk of the nat instance, in GiB. Default: 8"
  default     = 8
}

variable "cloud_init_config" {
  type        = string
  description = "Content of a text/cloud-config, used to perform some operations when the machine is created. More info here: https://cloudinit.readthedocs.io/en/latest/topics/modules.html"
  default     = ""
}
