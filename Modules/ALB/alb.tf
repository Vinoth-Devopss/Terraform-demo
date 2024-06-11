
# ELB target_group.

resource "aws_alb_target_group" "prod_alb_tg" {
  name        = "prod-astrocure-co-in"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = "vpc-0370d4779722a734c"
  health_check {
    interval            = 5
    path                = "/"
    protocol            = "HTTP"
    timeout             = 2
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher = "200"
  }
}

/*
# Add Ec2 with target_group..

resource "aws_lb_target_group_attachment" "prod_ec2_alb_tg" {
  target_group_arn = "arn:aws:elasticloadbalancing:ap-south-2:623683966429:targetgroup/prod-astrocure-co-in/228ba0c46c1d026b"
  target_id      = "i-097f708f2d6610c8e"
  port             = 80
}

resource "aws_lb_target_group_attachment" "prod_ec2_alb_tg_1" {
  target_group_arn = "arn:aws:elasticloadbalancing:ap-south-2:623683966429:targetgroup/prod-astrocure-co-in/228ba0c46c1d026b"
  target_id      = "i-0702aaab850b9b335"
  port             = 80
}

*/


# astrocure ALB.

resource "aws_alb" "prod_alb" {
  name               = "prod-astrocure-co-in"
  internal           = false
  load_balancer_type = "application"
  security_groups = var.security_group_id
  subnets = var.alb_subnets
  tags = {
    name = "prod-astrocure-co-in"
  }
}


# ELB listener for HTTPS.

resource "aws_lb_listener" "cert-listener" {
  load_balancer_arn = "arn:aws:elasticloadbalancing:ap-south-2:623683966429:loadbalancer/app/prod-astrocure-co-in/36d1398d9db0a822"
  port = "443"
  protocol = "HTTPS"
  certificate_arn = "arn:aws:acm:ap-south-2:623683966429:certificate/3c34369a-580f-4d93-a730-285893535c6c"
  default_action {
    type = "forward"
   target_group_arn = aws_alb_target_group.prod_alb_tg.arn
  }
}

# ELB listener for HTTP.

resource "aws_lb_listener" "application_listener" {
  load_balancer_arn = aws_alb.prod_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.prod_alb_tg.arn
  }
}




