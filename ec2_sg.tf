provider "aws" {
  region = "us-east-1"
  access_key = "AKIA2SLULZTNL6GYY2MZ"
  secret_key = "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"
}

resource "aws_instance" "ec2" {
    ami = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    key_name = "ecr"
    security_groups = ["rtp03-sg"]
}

resource "aws_security_group" "rtp03-sg" {
    name = "rtp03-sg"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "ssh-sg"

    }

}
