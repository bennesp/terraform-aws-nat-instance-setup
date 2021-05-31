data "cloudinit_config" "nat_instance" {
  # Script used by amazon for their old AMI of nat instance:
  # https://serverfault.com/questions/406351/how-to-configure-a-custom-nat-for-use-in-amazon-vpc

  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = <<-EOF
      runcmd:
        - sysctl -q -w net.ipv4.ip_forward=1
        - iptables -t nat -A POSTROUTING -o ens5 -s ${aws_subnet.private.cidr_block} -j MASQUERADE
      ${var.cloud_init_config}
    EOF
  }
}
