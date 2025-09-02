variable "vpc_subnet" {
    description= "cidr of vpc subnet"
    type= string
    default= "10.0.0.0/16"
}
variable "public_subnet" {
    description = "this is public subnet of vpc"
    type= string
    default ="10.0.1.0/24"
} 
variable "private_subnet" {
    description= "this is private subnet of vpc"
    type= string
    default= "10.0.2.0/24"
}
variable "available_zone" {
    description= "this provides the avaliability zone for the subnets"
    type= string
    default= "us-east-1a"
}
