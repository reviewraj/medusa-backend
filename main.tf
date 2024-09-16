resource "aws_instance" "my_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name   = "private_21_08_24"
  subnet_id     = aws_subnet.subnet_id.id
  vpc_security_group_ids = [aws_security_group.sg_id.id] 
    tags = {
    Name = var.instance_name
  }
}
