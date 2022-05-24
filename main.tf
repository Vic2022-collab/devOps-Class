[20:20:03] [$$ enctrypted $$]
# creating aws networking for a project

resource "aws_vpc" "Project_Terraform" {
  cidr_block           = var.vpc-cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "Project_Terraform"
  }
}


# creating a public subnet1

resource "aws_subnet" "project_public_subnet1" {
  vpc_id            = aws_vpc.Project_Terraform.id
  cidr_block        = var.pubsub1-cidr
  availability_zone = var.az1

  tags = {
    Name = "project_public_subnet1"
  }
}


# creating a public subnet2

resource "aws_subnet" "project_public_subnet2" {
  vpc_id            = aws_vpc.Project_Terraform.id
  cidr_block        = var.pubsub2-cidr
  availability_zone = var.az2

  tags = {
    Name = "project_public_subnet2"
  }
}


# creating a private subnet1

resource "aws_subnet" "project_private_subnet1" {
  vpc_id            = aws_vpc.Project_Terraform.id
  cidr_block        = var.privsub1-cidr
  availability_zone = var.az3

  tags = {
    Name = "project_private_subnet1"
  }
}

# creating a private subnet2

resource "aws_subnet" "project_private_subnet2" {
  vpc_id            = aws_vpc.Project_Terraform.id
  cidr_block        = var.privsub2-cidr
  availability_zone = var.az4

  tags = {
    Name = "project_private_subnet2"
  }
}

# creating a public route table

resource "aws_route_table" "project_public_route_table" {
  vpc_id = aws_vpc.Project_Terraform.id


  tags = {
    Name = "project_public_route_table"
  }
}


# creating a private route table

resource "aws_route_table" "project_private_route_table" {
  vpc_id = aws_vpc.Project_Terraform.id


  tags = {
    Name = "project_private_route_table"
  }
}


# associate Public subnet1 with the public route table

resource "aws_route_table_association" "project-public-association1" {
  subnet_id      = aws_subnet.project_public_subnet1.id
  route_table_id = aws_route_table.project_public_route_table.id
}

# associate Public subnet2 with public route table

resource "aws_route_table_association" "project-public-association2" {
  subnet_id      = aws_subnet.project_public_subnet2.id
  route_table_id = aws_route_table.project_public_route_table.id
}

# associate Private subnet1 with the private route table

resource "aws_route_table_association" "project-private-association1" {
  subnet_id      = aws_subnet.project_private_subnet1.id
  route_table_id = aws_route_table.project_private_route_table.id
}

# associate Private subnet2 with private route table

resource "aws_route_table_association" "project-private-association2" {
  subnet_id      = aws_subnet.project_private_subnet2.id
  route_table_id = aws_route_table.project_private_route_table.id
}

# internet gateway

resource "aws_internet_gateway" "project_IGW" {
  vpc_id = aws_vpc.Project_Terraform.id

  tags = {
    Name = "Project_Terraform"
  }
}

# associating internet gateway to the public route table

resource "aws_route" "project_IGW_association" {
  route_table_id         = aws_route_table.project_public_route_table.id
  gateway_id             = aws_internet_gateway.project_IGW.id
  destination_cidr_block = "0.0.0.0/0"
}