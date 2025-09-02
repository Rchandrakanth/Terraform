output "vpc_id"{
    description= "getting the id of vpc"
    value= aws_vpc.my_vpc.id
}
output "public_subnet_id"{
    description= "getting the public ip"
    value=aws_subnet.public.id
}
output "private_subnet_id"{
    description= "getting the private subnet ip"
    value=aws_subnet.private.id
}
output "security_group_id" {
    description= "getting the security group id"
    value= aws_security_group.webserver_grp.id
}
output "aws_instance_id" {
    description ="getting the instance id"
    value= aws_instance.webserver.id
}
output "public_ip" {
    description="getting the public ip of instance"
    value= aws_instance.webserver.public_ip
}
