#------------------------------------------------------------------------------
# S3 VPC Endpoint
#------------------------------------------------------------------------------
data "aws_vpc_endpoint_service" "s3_endpoint" {
  count = var.create_vpc ? 1 : 0

  service      = "s3"
  service_type = "Gateway"
}

resource "aws_vpc_endpoint" "s3_endpoint" {
  count = var.create_vpc ? 1 : 0

  vpc_id            = aws_vpc.main[0].id
  service_name      = data.aws_vpc_endpoint_service.s3_endpoint[0].service_name
  vpc_endpoint_type = "Gateway"

  tags = merge(
    { Name = "${var.friendly_name_prefix}-s3-vpc-endpoint" },
    { type = "gateway" },
    var.common_tags
  )
}

resource "aws_vpc_endpoint_route_table_association" "rtbassoc_s3_public" {
  count = var.create_vpc && length(var.public_subnet_cidrs) > 0 ? 1 : 0

  vpc_endpoint_id = aws_vpc_endpoint.s3_endpoint[0].id
  route_table_id  = aws_route_table.rtb_public[0].id
}

resource "aws_vpc_endpoint_route_table_association" "rtbassoc_s3_private" {
  count = var.create_vpc ? length(var.public_subnet_cidrs) : 0

  vpc_endpoint_id = aws_vpc_endpoint.s3_endpoint[0].id
  route_table_id  = element(aws_route_table.rtb_private.*.id, count.index)
}