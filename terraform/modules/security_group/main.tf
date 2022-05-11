resource "aws_security_group" "public" {
  name = var.sg_name_public
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

  vpc_id = var.sg_vpc_id

      tags = merge(tomap({ "Name" = format("%s", var.sg_name_public) }),
    var.all_tags, var.sg_public_tags )
}


resource "aws_security_group" "private" {
  name = var.sg_name_private
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.public.id]

  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [aws_security_group.public.id]
  }
depends_on = [
  aws_security_group.public
]

 vpc_id = var.sg_vpc_id

       tags = merge(tomap({ "Name" = format("%s", var.sg_name_private) }),
    var.all_tags, var.sg_private_tags )
}

resource "aws_security_group_rule" "private" {

    security_group_id = aws_security_group.private.id
    type = "ingress"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]


}