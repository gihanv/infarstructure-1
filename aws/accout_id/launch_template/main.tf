
module "lauch_template" {

  source                                  = "../../../terraform/modules/lauch_template/"
  lt_vpc_id                               = local.lt_vpc_id
  lt_iam_instance_profile                 = local.aim_profile_name
  lt_name                                 = local.launch_template_name
  lt_ebs_path                             = "/dev/sda1"
  lt_ebs_size                             = 20
  lt_credit_specification                 = "standard"
  lt_disable_api_termination              = "false"
  lt_instance_type                        = local.instance_type
  lt_image_id                             = local.instance_id
  lt_instance_initiated_shutdown_behavior = local.shutdown_behavior
  lt_public_ip                            = "true"
  lt_key_name                             = local.key_name
  lt_user_data                            = filebase64("${path.module}/data/UserData.sh")
  all_tags                                = merge(local.resource_tags, local.default_tags)

}
