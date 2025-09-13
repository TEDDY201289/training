#------------------------------------------------------------------------------
# Internet Gateway
#------------------------------------------------------------------------------
resource "aws_internet_gateway" "igw" {
  count = var.create_vpc ? 1 : 0

  vpc_id = aws_vpc.main[0].id

  tags = merge(
    { Name = "${var.friendly_name_prefix}-igw" },
    var.common_tags
  )
}

#------------------------------------------------------------------------------
# Elastic IPs
#------------------------------------------------------------------------------
resource "aws_eip" "nat_eip" {
  count = var.create_vpc && length(var.public_subnet_cidrs) > 0 ? length(var.public_subnet_cidrs) : 0

  #vpc        = true
  depends_on = [aws_internet_gateway.igw]

  tags = merge(
    { Name = "${var.friendly_name_prefix}-nat-eip" },
    var.common_tags
  )
}