provider "aws" {
  region = "us-east-1"
  access_key = "AKIAIN25CT5YXKNFUW4A"
  secret_key = "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"
}

 resource "aws_key_pair" "public-key" {
  key_name   = "public-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC0qsVKctZ87FfSaVfbhvrTRoLacT2a5e/xgFmsdglHsrm9RJbQmmDCUCXp/jJ4z/oDn95kqu8fm6l+fFnHH57kwCIqGWUfA+2Yk7biTtYaFaMVa6eQFtO5bYpQovUHSZx7JV+eAHafBfOOPeDX9Dc0k3RcLvbMoNDPlaU7nXkkb4wdf1J8nOnV14vwnvDrzSD3KXkGXD9CFhTyrXJgZixr2MJ6sXR+V1wYkd2MK5yjms3huTqgC18YfnULfJobiZrO2oK4yNy1ikFPMLSIeQFrusztn4aJvqSqbUnwhrQP0N8lh38iu0vGNW8xlG10P/VdoRtHCN1+bWhmCWkqxPzh harvindersingh@Harvinders-MacBook-Pro.local"
}

resource "aws_instance" "web" {
  ami           = "ami-0036ab7a"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.public-key.key_name}"
  security_groups = [
    "${aws_security_group.access-https.name}",
    "${aws_security_group.access-http.name}",
    "${aws_security_group.access-ssh.name}"
  ]
  associate_public_ip_address = true
}

resource "aws_security_group" "access-https" {
  name = "access-https"
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
}

resource "aws_security_group" "access-ssh" {
  name = "access-ssh"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
}

resource "aws_security_group" "access-http"{
  name = "access-http"
  ingress {
    from_port = 80
    to_port   = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
}
