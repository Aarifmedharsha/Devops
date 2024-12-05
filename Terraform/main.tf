provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "Aarif_Instance" {
  ami           = "ami-04dd23e62ed049936"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-example"
  }
}
