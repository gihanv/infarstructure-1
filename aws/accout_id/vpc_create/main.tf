
module "vpc_test" {

  source = "../../../terraform/modules/vpc/"

  name               = local.vpc_name
  cidr               = local.vpc_cidr
  azs                = local.vpc_azs
  private_subnets    = local.vpc_private_subnets
  public_subnets     = local.vpc_public_subnets
  enable_nat_gateway = true
  single_nat_gateway = false

  all_tags = merge(local.resource_tags, local.default_tags)

  public_subnet_tags = {
    Tier    = "security"
    Privacy = "public"

  }

  private_subnet_tags = {
    Tier    = "application"
    Privacy = "private"

  }

  vpc_tags = {
    Vpc_Type = "Bestseller-Noneprod"
  }

  nat_eip_tags ={
      Name= "Bestseller-NG-Ip"
  }

  private_route_table_tags={
      Name= "Bestseller-Pvt-RT"
  }

public_route_table_tags={
      Name= "Bestseller-Pub-RT"
  }


 igw_tags ={
      Name= "Bestseller-IG-Ip"
  }

   nat_gateway_tags ={
      Name= "Bestseller-NG"
  }



}