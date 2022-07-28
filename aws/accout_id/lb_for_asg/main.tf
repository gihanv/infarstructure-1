
module "alb_for_asgc" {

  source = "../../../terraform/modules/lb/"

  lb_asg_name    = local.asg_name
  lb_vpc_id      = local.vpc_id
  lb_name        = local.lb_name
  lb_sg_name_alb = "sg_alb"
  lb_sg_name_acg = "sg_auto"
  lb_pub_sg_tag  = "public"
  lb_target_name = local.lb_target_name
  all_tags       = merge(local.resource_tags, local.default_tags)


}
