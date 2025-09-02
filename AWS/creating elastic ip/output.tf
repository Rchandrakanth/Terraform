

  output "instance_public_ip"{                        --> getting the ec2 public ip 
      description="public ip of instance"
      value= aws_instance.web_server.public_ip
  }
  
  output  "elastic_ip"{
      description="public ip of elastic ip"         ---->> getting elastic ip 
      value= aws_eip.elastic_ip.public_ip
  }
