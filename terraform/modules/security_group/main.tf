resource "aws_security_group" "to_lb" {
  name = var.lb_sg_name_lb
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = var.lb_vpc_id

      tags = merge(tomap({ "Name" = format("%s", var.lb_sg_name_lb) }),
    var.all_tags, var.ec2_tags,var.alb_tags  )
}


resource "aws_security_group" "to_acg" {
  name = var.lb_sg_name_ec2
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.to_lb.id]

  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.to_lb.id]
  }
depends_on = [
  aws_security_group.to_lb
]

 vpc_id = var.lb_vpc_id

       tags = merge(tomap({ "Name" = format("%s", var.lb_sg_name_ec2) }),
    var.all_tags, var.ec2_tags )
}

resource "aws_security_group_rule" "ec2" {

    security_group_id = aws_security_group.to_acg.id
    type = "ingress"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]


}