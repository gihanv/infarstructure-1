

data "aws_security_groups" "lb" {
  filter {
    name   = "group-name"
    values = [var.lb_sg_name_alb]
  }

  filter {
    name   = "vpc-id"
    values = [var.lb_vpc_id]
  }
}


data "aws_subnets" "lb_subs" {
  filter {
    name   = "vpc-id"
    values = [var.lb_vpc_id]
  }

  tags = {
    Name = var.lb_pub_sg_tag
  }
}

data "aws_subnet" "lb_id" {
  for_each = toset(data.aws_subnets.lb_subs.ids)
  id       = each.value
}


resource "aws_lb" "asc" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.aws_security_groups.lb.ids[0]]
  subnets            = [for value in data.aws_subnet.lb_id : value.id]

  enable_deletion_protection = false

  /*
#### disable . I don't have extra s3 buckt :)
  access_logs {
    bucket  = aws_s3_bucket.lb_logs.bucket
    prefix  = "test-lb"
    enabled = true
  }
*/


  tags = var.all_tags



}


resource "aws_lb_target_group" "lb_tg" {
  name        = "${var.lb_name}-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.lb_vpc_id



  depends_on = [
    aws_lb.asc
  ]
}


resource "aws_lb_listener" "alb" {
  load_balancer_arn = aws_lb.asc.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_tg.arn
  }
  depends_on = [
    aws_lb_target_group.lb_tg, aws_lb.asc
  ]

}




    