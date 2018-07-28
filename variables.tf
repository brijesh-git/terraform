variable "aws_vpc_name" {
  type = "map"
}

variable "aws_region" {
  type    = "string"
  default = "us-west-2"
}

variable "aws_vpc" {
  type = "map"

  default = {
    "name"       = "aws_vpc"
    "cidr_block" = "10.0.0.0/16"
    "tags"       = "aws_vpc"
  }
}

variable "regions" {
  type    = "list"
  default = ["region1", "region2", "region3"]
}

//Output variables

output "subnet_id" {
  value = "${aws_subnet.terra-subnet-2.id}"
}
