
module "sg" {

  source = "../../../terraform/modules/security_group/"


  sg_vpc_id       = local.vpc_id
  sg_name_public  = "sg_alb"
  sg_name_private = "sg_private_ec2"
  all_tags        = merge(local.resource_tags, local.default_tags)


}
