resource "aws_vpc" "new_vpc" {
  cidr_block           = "${var.aws_vpc["cidr_block"]}"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags {
    name = "${var.aws_vpc["name"]}"
  }
}

resource "aws_subnet" "terra-subnet" {
  cidr_block        = "${cidrsubnet(aws_vpc.new_vpc.cidr_block, 3, 1)}"
  vpc_id            = "${aws_vpc.new_vpc.id}"
  availability_zone = "us-west-2a"

  tags {
    Name = "terra subnet"
  }
}

resource "aws_subnet" "terra-subnet-2" {
  cidr_block        = "${cidrsubnet(aws_vpc.new_vpc.cidr_block, 2, 2)}"
  vpc_id            = "${aws_vpc.new_vpc.id}"
  availability_zone = "us-west-2b"

  tags {
    Name = "terra subnet-2"
  }
}

resource "aws_security_group" "terra-sec-grp" {
  vpc_id      = "${aws_vpc.new_vpc.id}"
  description = "security group created through terraform"

  ingress {
    cidr_blocks = ["${aws_vpc.new_vpc.cidr_block}"]
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }

  egress {
    cidr_blocks = ["${aws_vpc.new_vpc.cidr_block}"]
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  }
}
