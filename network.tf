resource "aws_vpc" "dev_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags {
    Name = "${var.env}-vpc"
  }
}

resource "aws_subnet" "dev_subnet" {
  vpc_id     = "${aws_vpc.dev_vpc.id}"
  cidr_block = "10.0.1.0/24"
}


resource "aws_security_group" "dev_subnet_sg" {

  vpc_id     = "${aws_vpc.dev_vpc.id}"
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = -1
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_internet_gateway" "dev-gw" {
  vpc_id = "${aws_vpc.dev_vpc.id}"
  tags {
    Name = "${var.env}-internet-gw"
  }
}

# route tables
resource "aws_route_table" "dev-public" {
  vpc_id = "${aws_vpc.dev_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.dev-gw.id}"
  }

  tags {
    Name = "${var.env}-route-tb"
  }
}

# route associations public
resource "aws_route_table_association" "dev-public-1-a" {
  subnet_id = "${aws_subnet.dev_subnet.id}"
  route_table_id = "${aws_route_table.dev-public.id}"
}
