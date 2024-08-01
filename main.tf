# local BE
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region     = var.aws_region
  profile = "default"
}

module "network" {
  source      = "./network" # variables defaulted

}

module "security_group" {
  source      = "./security_group"
  vpc_id      = module.network.vpc_id # used network module output as a variable
}

module "jenkins_instance"{
  source      = "./jenkins_instance"
  sg_for_jenkins = [module.security_group.sg_ec2_jenkins_port_8080, module.security_group.open_sg]
  subnet_id = tolist(module.network.public_subnets_id)[0] # takes the first public subnet
  public_key = var.public_key
  jenkins_install_script = templatefile("./jenkins_script/installer.sh", {})
}

module "lb_target_group" {
  source = "./lbtg"
  lb_target_group_name = "jenkins-tg"
  lb_target_group_port = 8080
  lb_target_group_protocol = "HTTP"
  vpc_id = module.network.vpc_id
  ec2_instance_id = module.jenkins_instance.jenkins_id

}

module "application_load_balancer" {
  source = "./load_balancer"
  lb_name = "jenkins-alb"
  lb_type = "application"
  lb_listner_default_action = "forward"
  lb_target_group_arn = module.lb_target_group.lb_target_group_arn
  ec2_instance_id = module.jenkins_instance.jenkins_id
  #certificate_arn = ehhh

 



  
}