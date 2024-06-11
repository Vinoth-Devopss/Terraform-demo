# astrovidhi-prod Launch template..!

# data "aws_availability_zones" "all" {}

resource "aws_launch_configuration" "prod-api-lt" {
  name_prefix     = "prod-api.astrocure.co.in"
  image_id        =  var.asg_ami_id
  instance_type   =  var.instance_type
  key_name        =  var.prod-api_key_name
  security_groups  =  [var.asg_security_group_id]
  associate_public_ip_address = true
  user_data = filebase64("${path.module}/prod-server.sh")

root_block_device {
    delete_on_termination = "true"
    encrypted             = "false"
    iops                  = "3000"
    volume_size           = "20"
    volume_type           = "gp3"
  }

lifecycle {
    create_before_destroy = true
  }
}



resource "aws_lb_listener" "prod_lb_listener" {
  load_balancer_arn = "arn:aws:elasticloadbalancing:ap-south-2:623683966429:loadbalancer/app/prod-astrocure-co-in/36d1398d9db0a822"
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "arn:aws:elasticloadbalancing:ap-south-2:623683966429:targetgroup/prod-astrocure-co-in/228ba0c46c1d026b"
  }
}

/*

# astrovidhi-prod Auto Scalling Group.

resource "aws_autoscaling_group" "prod_asg" {
  name                      = "prod-api-asg"
  # availability_zones      = data.aws_availability_zones.all.names
  vpc_zone_identifier       = ["subnet-0de70fb106c2c9385", "subnet-087e247aef8da2b51", "subnet-010aa14f3deca64af"]
  launch_configuration      = aws_launch_configuration.prod-api-lt.name
  desired_capacity          = 1
  min_size                  = 1
  max_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  target_group_arns = ["arn:aws:elasticloadbalancing:ap-south-2:623683966429:targetgroup/prod-astrocure-co-in/228ba0c46c1d026b"]
  tag {
    key                 = "Name"
    value               = "prod-api.astrocure.co.in"
    propagate_at_launch = true
  }
}


# astrovidhi-prod AWS Auto Scaling Policy.
resource "aws_autoscaling_policy" "prod_api_ec2_policy_up" {
  name = "prod_api_ec2_policy_up"
  scaling_adjustment = 1
  adjustment_type = "ChangeInCapacity"
  cooldown = 300
  autoscaling_group_name = "${aws_autoscaling_group.prod_asg.name}"
}

resource "aws_cloudwatch_metric_alarm" "prod_api_ec2_cpu_alarm_up" {
  alarm_name = "prod_api_ec2_cpu_alarm_up"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "120"
  statistic = "Average"
  threshold = "70"
dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.prod_asg.name}"
  }

alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions = [ "${aws_autoscaling_policy.prod_api_ec2_policy_up.arn}" ]
}


resource "aws_autoscaling_policy" "prod_api_ec2_policy_down" {
  name = "prod_api_ec2_policy_down"
  scaling_adjustment = -1
  adjustment_type = "ChangeInCapacity"
  cooldown = 300
  autoscaling_group_name = "${aws_autoscaling_group.prod_asg.name}"
}

resource "aws_cloudwatch_metric_alarm" "prod_api_ec2_cpu_alarm_down" {
  alarm_name = "prod_api_ec2_cpu_alarm_down"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "120"
  statistic = "Average"
  threshold = "30"
dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.prod_asg.name}"
  }

alarm_description = "This metric monitor EC2 instance CPU utilization"
  alarm_actions = [ "${aws_autoscaling_policy.prod_api_ec2_policy_down.arn}" ]
}

*/



