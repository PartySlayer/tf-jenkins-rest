output "open_sg" {
  value = aws_security_group.ssh_http_open.id
}

output "sg_ec2_jenkins_port_8080" {
  value = aws_security_group.sg_jenkins.id
}
