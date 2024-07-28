output "jenkins_ssh" {
  value = module.jenkins_instance.ssh_connection_string_for_ec2
}