
data "aws_subnets" "example" {
  filter {
    name   = "vpc-id"
    values = [var.asg_vpc_id]
  }

  tags = {
    Privacy = var.asg_pvt_sg_tag
  }
}

data "aws_subnet" "example" {
  for_each = toset(data.aws_subnets.example.ids)
  id       = each.value
}

data "aws_launch_template" "name" {
  name = var.asg_launch_template_name
}

resource "aws_autoscaling_group" "asg_bestseller" {

  name                = var.asg_name
  force_delete        = true
  vpc_zone_identifier = [for value in data.aws_subnet.example : value.id]
  desired_capacity    = var.asg_desired_capacity
  max_size            = var.asg_max_size
  min_size            = var.asg_min_size
  default_cooldown    = 120
  health_check_type   = "ELB"
  target_group_arns   = ["${var.asg_lb_tg_arn}"]

  launch_template {
    id      = data.aws_launch_template.name.id
    version = var.asg_launch_template_version
  }



  initial_lifecycle_hook {
    name                 = "asg_lifecycle_hook"
    default_result       = "CONTINUE"
    heartbeat_timeout    = 300
    lifecycle_transition = "autoscaling:EC2_INSTANCE_LAUNCHING"
  }

}
  
  
  resource "aws_autoscaling_policy" "down" {
  name                   = "scale_down_ploicy"
  autoscaling_group_name = aws_autoscaling_group.asg_bestseller.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = -1
  cooldown               = 120
}

  resource "aws_autoscaling_policy" "up" {
  name                   = "scale_up_ploicy"
  autoscaling_group_name = aws_autoscaling_group.asg_bestseller.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = 1
  cooldown               = 120
}
