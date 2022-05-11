
module "asc" {

  source = "../../../terraform/modules/auto_scale_group/"

  asg_vpc_id                  = local.vpc_id
  asg_pvt_sg_tag              = local.pvt_sg_tag
  asg_name                    = local.name
  asg_launch_template_version = "$Latest"
  asg_launch_template_name    = "lt_apache2"
  asg_desired_capacity        = local.desired_capacity
  asg_max_size                = local.max_size
  asg_min_size                = local.min_size
  asg_lb_tg_arn               = local.lb_arn



}
