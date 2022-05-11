
module "security_group" {

  source = "../../../terraform/modules/security_group/"


    lb_vpc_id      = local.vpc_id
    lb_sg_name_lb = "sg_alb"
    lb_sg_name_ec2 = "sg_private_ec2"
    all_tags       = merge(local.resource_tags, local.default_tags)


}
