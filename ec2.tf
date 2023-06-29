provider "aws" {
  region = "us-east-1"  
}

resource "aws_instance" "my-instance" {
  ami           = "ami-053b0d53c279acc90"  
  instance_type = "t2.micro"  

  key_name      = "linux"  

  tags = {
    Name = "my-instance"
  }
}
