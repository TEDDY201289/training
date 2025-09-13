#------------------------------------------------------------------------------
# NAT Gateways
#------------------------------------------------------------------------------
resource "aws_nat_gateway" "ngw" {
  count = var.create_vpc && length(var.public_subnet_cidrs) > 0 ? length(var.public_subnet_cidrs) : 0

  allocation_id = element(aws_eip.nat_eip.*.id, count.index)
  subnet_id     = element(aws_subnet.public.*.id, count.index)

  # depends_on = [
  #   aws_internet_gateway.igw,
  #   aws_eip.nat_eip,
  #   aws_subnet.public,
  # ]

  tags = merge(
    { Name = "${var.friendly_name_prefix}-ngw-${count.index}" },
    var.common_tags
  )
}