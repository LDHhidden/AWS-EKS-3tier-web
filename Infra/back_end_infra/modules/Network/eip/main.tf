resource "aws_eip" "demo" {
  
  tags = {
    Name = "My-eip"
  }
}