
output "jenkins_id" {
  value = aws_instance.jenkins.id
}

output "ssh_connection_string_for_ec2" {
  value = format("%s%s", "ssh -i /root/.ssh/aws_ec2_terraform ubuntu@", aws_instance.jenkins.public_ip)
}

output "jenkins_public_ip" {
  value = aws_instance.jenkins.public_ip
}
