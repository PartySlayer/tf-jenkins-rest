resource "aws_lb" "lb" {
  name                        = var.lb_name
  load_balancer_type          = var.lb_type
  security_groups             = [module.security_group.open_sg]
  subnets                     = [module.network.public_subnets_id]
  internal                    = var.internal
  enable_deletion_protection  = false 

  tags = {
    name = "lb-jenkins-tf"
  }
}

resource "aws_lb_target_group_attachment" "lb_target_group_attachment" {
  target_group_arn = var.lb_target_group_arn
  target_id        = var.ec2_instance_id 
  port             = var.lb_target_group_attachment_port
}

resource "aws_lb_listener" "lb_listner" {
  load_balancer_arn = aws_lb.lb.arn
  port              = var.lb_listner_port
  protocol          = var.lb_listner_protocol

  default_action {
    type             = var.lb_listner_default_action
    target_group_arn = var.lb_target_group_arn
  }
}

# https listner on port 443
resource "aws_lb_listener" "https_lb_listner" {
  load_balancer_arn = aws_lb.lb.arn
  port              = var.lb_https_listner_port
  protocol          = var.lb_https_listner_protocol
  #ssl_policy        = 
  #certificate_arn   = var.certificate_arn     add policy and certificate

  default_action {
    type             = var.lb_listner_default_action
    target_group_arn = var.lb_target_group_arn
  }
}