
# resource "aws_launch_configuration" "as_conf" {
#   image_id       = var.asg_image_id
#   instance_type  = var.asg_instance_type
#   security_groups = ["sg-05d67a19d8e2e618b"]
#   #spot_price    = "0.001"

#   lifecycle {
#     create_before_destroy = true
#   }
# }


data "aws_subnets" "example" {
  filter {
    name   = "vpc-id"
    values = [var.asg_vpc_id]
  }

  tags = {
    #Privacy = var.asg_pvt_sg_tag
     Privacy = "public"
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
  
  name = var.asg_name
  #launch_configuration = aws_launch_configuration.as_conf.name
  force_delete              = true
  vpc_zone_identifier  = [for value in data.aws_subnet.example: value.id]
  desired_capacity   = var.asg_desired_capacity
  max_size           = var.asg_max_size
  min_size           = var.asg_min_size 
  default_cooldown          = 120 
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