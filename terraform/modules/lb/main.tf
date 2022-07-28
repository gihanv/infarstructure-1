data "aws_security_groups" "test" {
  tags = {
    Apply = "public"
  }
}


data "aws_autoscaling_group" "asc_alb" {
  name = var.lb_asg_name
}

data "aws_subnets" "example" {
  filter {
    name   = "vpc-id"
    values = [var.lb_vpc_id]
  }

  tags = {
    Privacy = var.lb_pub_sg_tag
  }
}

data "aws_subnet" "example" {
  for_each = toset(data.aws_subnets.example.ids)
  id       = each.value
}


resource "aws_lb_target_group" "asc_lb_tg" {
  name     = var.lb_target_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.lb_vpc_id 
}


resource "aws_lb_listener" "asg_listener" {
  load_balancer_arn = aws_lb.asc.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = data.aws_autoscaling_group.asc_alb.arn
  }
}

resource "aws_autoscaling_attachment" "scg_attach" {
  autoscaling_group_name = data.aws_autoscaling_group.asc_alb.id
  lb_target_group_arn   = aws_lb_target_group.asc_lb_tg.arn
  
}



resource "aws_lb" "asc" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg-015052938b4c507dc"]
  subnets            = [for value in data.aws_subnet.example : value.id]

  enable_deletion_protection = true

/*
#### disable . I don't have extra s3 buckt :)
  access_logs {
    bucket  = aws_s3_bucket.lb_logs.bucket
    prefix  = "test-lb"
    enabled = true
  }
*/
 

    tags = var.all_tags
    

    depends_on = [
      aws_lb_target_group.asc_lb_tg,
      aws_autoscaling_attachment.scg_attach

    ]
}