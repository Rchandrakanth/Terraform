provider "aws" {
    region= "us-east-1"
}

resource "aws_instance" "web_server" {
    ami= "ami-00ca32bbc84273381"
    instance_type= "t2.micro"   
}

resource "aws_eip" "elastic_ip"{
    domain = "vpc"                 --> elastic ip will get from the vpc
}

resource "aws_eip_association" "eip_assoc"{             ---> maps the eip to ece2 
    instance_id= aws_instance.web_server.id
    allocation_id= aws_eip.elastic_ip.id
}
