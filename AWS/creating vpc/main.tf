# creating the aws provider

provider "aws" {
    region= "us-east-1"
}

# creating the vpc in aws 

resource "aws_vpc" "my_vpc" {
    cidr_block= var.vpc_subnet
}

# creating public and private subnets

resource "aws_subnet" "public" {
    vpc_id= aws_vpc.my_vpc.id
    cidr_block= var.public_subnet
    availability_zone= var.available_zone
}
resource "aws_subnet" "private" {
    vpc_id =aws_vpc.my_vpc.id
    cidr_block= var.private_subnet
    availability_zone= var.available_zone
}

# creating internet gateway 

resource "aws_internet_gateway" "it_gateway"{
    vpc_id=aws_vpc.my_vpc.id
}

# creating route table  

resource "aws_route_table" "public_rt" {
    vpc_id=aws_vpc.my_vpc.id
    route{
        cidr_block="0.0.0.0/0"
        gateway_id= aws_internet_gateway.it_gateway.id
    }
}

# associating route table with public subnet

resource "aws_route_table_association" "public_assoc"{
    subnet_id= aws_subnet.public.id
    route_table_id=aws_route_table.public_rt.id

}

# creating security group 

resource "aws_security_group" "webserver_grp"{
    name= "web_server_sg"
    vpc_id= aws_vpc.my_vpc.id
    description= "allowing http and ssh traffic using security group"

    ingress{
        from_port=22
        to_port=22
        protocol="tcp"
        cidr_blocks=["157.10.25.5/32"] ----> public ip of any machine
    }

    ingress{
        from_port= 80
        to_port=80
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"]
    }

    egress {
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    }

}

# creating ec2 instance

resource "aws_instance" "webserver" {
    ami="ami-00ca32bbc84273"   ---> give your ami id
    instance_type= "t2.micro"

    subnet_id=aws_subnet.public.id
    vpc_security_group_ids=[aws_security_group.webserver_grp.id]
    associate_public_ip_address=true
}
