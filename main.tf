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