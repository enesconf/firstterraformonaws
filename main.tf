provider "aws" {
   region = "eu-west-1"
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.web.id
  allocation_id = aws_eip.finance.id
}

resource "aws_instance" "web" {
  ami                    = "ami-0bf84c42e04519c85"
  instance_type          = var.instance_type
  monitoring             = false
  vpc_security_group_ids = ["sg-078c4e34b222e338a"]
  subnet_id              = "subnet-0cc51012ff3026480"
  key_name               = var.key_name
  

  tags = {
    Terraform   = "true"
    Environment = "dev1"
    Department   = "Finance"
    Name= "terraform-first-instance"
  }

  user_data = <<EOF
    #! /bin/bash
    sudo yum update -y
    sudo yum install -y httpd.x86_64
    sudo service httpd start
    sudo service httpd enable
    echo "<h1>First Terraform </h1>" | sudo tee /var/www/html/index.html
  EOF


}

resource "aws_eip" "finance" {
  vpc      = true
}
