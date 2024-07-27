variable "ami_id" {
    default = "ami-027f7881d2f6725e1" # ubuntu
    description = "ami jenkins"
}

variable "instance_type" {
    default = "t2.micro"
    description = "jenkins instance size"
}

variable "public_key" {
    description = "jenkins public key"
}
variable "subnet_id" {
    description = "subnet id for jenkins"
}
variable "sg_for_jenkins" {
    description = "security groups used by jenkins"
}

variable "jenkins_install_script" {
    description = "path to jenkins installation script"
}
