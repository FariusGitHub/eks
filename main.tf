provider "aws" {
  region     = "us-east-1"
  access_key = jsondecode(file("aws.credentials")).access
  secret_key = jsondecode(file("aws.credentials")).secret
}

resource "aws_vpc" "vpc-project6" {
    cidr_block = "10.2.0.0/16"
    tags = {
    Name = "vpc-project6"
    }
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

resource "aws_subnet" "pub-subnet" {
    vpc_id = aws_vpc.vpc-project6.id
    cidr_block = "10.2.254.0/24"
    availability_zone       = "us-east-1a"
    tags = {
    Name = "pub-subnet"
    }
}

resource "aws_subnet" "pub-subnet2" {
    vpc_id = aws_vpc.vpc-project6.id
    cidr_block = "10.2.253.0/24"
    availability_zone       = "us-east-1b"
    tags = {
    Name = "pub-subnet2"
    }
}

resource "aws_internet_gateway" "igw-vpc-project6" {
    vpc_id = aws_vpc.vpc-project6.id
    tags = {
    Name = "igw-vpc-project6"
    }
}

resource "aws_route_table" "rt-pub-project6" {
vpc_id = aws_vpc.vpc-project6.id
route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.igw-vpc-project6.id
}
tags = {
Name = "rt-pub-project6"
}
}

resource "aws_route_table_association" "rt-pub_association-project6" {
    subnet_id = aws_subnet.pub-subnet.id
    route_table_id = aws_route_table.rt-pub-project6.id
}

resource "aws_route_table_association" "rt-pub_association-project6b" {
    subnet_id = aws_subnet.pub-subnet2.id
    route_table_id = aws_route_table.rt-pub-project6.id
}

resource "aws_security_group" "sg_api_project6" {
  name        = "sg_api_project6"
  description = "sg_api_project6"
  vpc_id      = aws_vpc.vpc-project6.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 

   ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }   

   ingress {
    from_port   = 8082
    to_port     = 8082
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }  

  tags = {
    Name = "sg_api_project6"
  }
}