variable "lb_name" {
    description = "name of the lb"
}
variable "lb_type" {
    description = "pick between application network or classic balancing"
}

variable "lb_target_group_arn" {
    description = "arn of the http target group"
}
variable "ec2_instance_id" {
    description = "id of the target vm"
}
variable "lb_listner_port" {
    description = "port where http listener is operating"
    default = 80
}
variable "lb_listner_protocol" {
    description = "protocol used by listener"
    default = "HTTP"
}
variable "lb_listner_default_action" {
    description = "default action when listener activates"
}
variable "lb_https_listner_port" {
    description = "port where https listener is operating"
    default = 443
}
variable "lb_https_listner_protocol" {
    description = "https listener protocol"
    default = "HTTPS"
}
# variable "certificate_arn" {
#     description = "SSL certificate arn"
# }
variable "lb_target_group_attachment_port" {
    description = "port used for target group attachment"
    default = 8080
}

variable "internal" {
    description = "defines if the lb is internal or not"

}

variable "subnets" {
    description = "subnet list"

}
variable "security_groups" {
    description = "security groups attached to the load balancer"
  
}