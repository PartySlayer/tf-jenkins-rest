variable "lb_target_group_name" {
    description = "name of the target group"
}
variable "lb_target_group_port" {
    description = "port where target group will send traffic"
}
variable "lb_target_group_protocol" {
    description = "protocol used by target group requests"
}

variable "ec2_instance_id" {
    description = "id of the target ec2 (jenkins vm)"
}

variable "vpc_id" {}