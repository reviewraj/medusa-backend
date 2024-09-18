# Reference existing VPC
data "aws_vpc" "medusa_network" {
  id = "vpc-02aca3c29abc1cd43"
}

# Reference existing Subnet
data "aws_subnet" "public_subnet" {
  id = "subnet-00a37eaefc5a11f57"
}

# Security Group allowing necessary ports
resource "aws_security_group" "medusa_security_grp" {
  vpc_id = data.aws_vpc.medusa_network.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "medusa_security_grp"
  }
}

# EC2 instance configuration
resource "aws_instance" "builtbyterraform" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = "pearlsthoughts_private_key"
  subnet_id     = data.aws_subnet.public_subnet.id
  vpc_security_group_ids = [resource.aws_security_group.medusa_security_grp.id]

  # User Data script for instance setup
  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y docker.io
    
    # Enable Docker service
    sudo systemctl enable docker
    sudo systemctl start docker
    
    # Install Docker Compose
    sudo curl -L "https://github.com/docker/compose/releases/download/2.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    
    # Verify installations
    docker --version
    docker-compose --version
  EOF

  tags = {
    Name = var.instance_name
  }
}
