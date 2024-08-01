resource "aws_instance" "jenkins" {
  ami           = var.ami_id    
  instance_type = var.instance_type
  tags = {
    name = "ec2-jenkins"
  }
  key_name                    = "aws_ec2_terraform"
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.sg_for_jenkins
  associate_public_ip_address = true

  user_data = var.jenkins_install_script

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required" # most secure option forcing IMDSv2 to retrieve instance info instead of v1
  }
}

