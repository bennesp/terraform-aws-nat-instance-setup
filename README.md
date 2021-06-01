# aws-nat-instance-setup

This is a common module for small setups where you want:

- A VPC with 2 subnets:
  - A private subnet
  - A public subnet with
    - a EC2 machine that acts as a NAT-instance/Router

Every machine you will create in the private subnet will reach internet
passing every packet through the NAT-instance.

For examples, see [below](#Examples).

For the auto-generated documentation, see [DOCS.md](./DOCS.md).

## Examples

### Minimal example

```hcl
module "test" {
  source = "bennesp/nat-instance-setup/aws"

  nat_instance_instance_type = "t3a.micro"

  cidr_block = "10.0.0.0/16"
  vpc_name   = "main"
  key_name   = "amz" # replace with the key you want, or with a resource reference
}
```

### Cloud-Init example

Let's say you want to perform some operations on startup of your nat instance
(for example install OpenVPN or other software).

You could do it with cloud-init, using the variable `cloud_init_config`:

```hcl
module "test" {
  source = "bennesp/nat-instance-setup/aws"

  nat_instance_instance_type = "t3a.micro"

  cidr_block = "10.0.0.0/16"
  vpc_name   = "main"
  key_name   = "amz" # replace with the key you want, or with a resource reference

  cloud_init_config = <<-EOF
    package_update: true
    packages:
      - vim
      - openvpn
      - easy-rsa
    final_message: "The system is finally up, after $UPTIME seconds"
  EOF
}
```

### Complete Example

Example with all the variable you can set

```hcl
module "test" {
  source = "bennesp/nat-instance-setup/aws"

  nat_instance_instance_type = "t3a.micro"
  nat_instance_volume_size   = 16
  nat_instance_name          = "router"

  allow_ssh_port = false # Don't create a security group rule for port 22

  cidr_block = "10.0.0.0/16"
  vpc_name   = "main"
  key_name   = "amz" # replace with the key you want, or with a resource reference

  cloud_init_config = <<-EOF
    package_update: true
    packages:
      - vim
      - openvpn
      - easy-rsa
    final_message: "The system is finally up, after $UPTIME seconds"
  EOF
}
```
