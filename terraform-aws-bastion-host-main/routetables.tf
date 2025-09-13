#------------------------------------------------------------------------------
# Route Tables & Routes
#------------------------------------------------------------------------------
resource "aws_route_table" "rtb_public" {
  count = var.create_vpc ? 1 : 0

  vpc_id = aws_vpc.main[0].id

  depends_on = [aws_internet_gateway.igw]

  tags = merge(
    { Name = "${var.friendly_name_prefix}-rtb-public" },
    var.common_tags
  )
}

resource "aws_route" "route_public" {
  count = var.create_vpc ? 1 : 0

  route_table_id         = aws_route_table.rtb_public[0].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw[0].id
}

resource "aws_route_table" "rtb_private" {
  count = var.create_vpc ? length(var.private_subnet_cidrs) : 0

  vpc_id = aws_vpc.main[0].id

  depends_on = [aws_nat_gateway.ngw]

  tags = merge(
    { Name = "${var.friendly_name_prefix}-rtb-private-${count.index}" },
    var.common_tags
  )
}

resource "aws_route" "route_private" {
  count = var.create_vpc ? length(var.private_subnet_cidrs) : 0

  route_table_id         = element(aws_route_table.rtb_private.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(aws_nat_gateway.ngw.*.id, count.index)
}

resource "aws_route_table_association" "rtbassoc-public" {
  count = var.create_vpc ? length(var.public_subnet_cidrs) : 0

  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.rtb_public[0].id
}

resource "aws_route_table_association" "rtbassoc-private" {
  count = var.create_vpc ? length(var.private_subnet_cidrs) : 0

  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.rtb_private.*.id, count.index)
}