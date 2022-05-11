variable "lt_vpc_id" {
  type        = string
  description = "pvt sg name "
}
variable "lt_name" {
  type        = string
  description = "launch_template name"
}

variable "lt_ebs_path" {
  type        = string
  description = "Specify volumes to attach to the instance besides the volumes specified by the AMI"
}

variable "lt_ebs_size" {
  type        = number
  description = "Specify volumes to attach to the instance besides the volumes specified by the AMI"
}


variable "lt_credit_specification" {
  type        = string
  default     = "standard"
  description = "Can be standard or unlimited"

}

variable "lt_disable_api_termination" {
  type        = bool
  description = "enables EC2 Instance Termination Protection"
  default     = "true"

}


variable "lt_instance_type" {
  type        = string
  description = "The type of the instance."

}
variable "lt_image_id" {
  type        = string
  description = " The AMI that can used to launch the instance"

}

variable "lt_instance_initiated_shutdown_behavior" {
  type    = string
  default = "terminate"

}
variable "lt_key_name" {
  type        = string
  description = "the key name to use for the instance"

}
variable "lt_am_role" {
  type        = string
  default     = "role_s3_full_access"
  description = "create s3_full_access role"

}

variable "lt_am_policy" {
  type        = string
  default     = "policy_s3_full"
  description = "create s3_full_access plicy"

}
variable "lt_public_ip" {
  type        = bool
  default     = "true"
  description = "create s3_full_access plicy"

}


variable "lt_iam_instance_profile" {
  type        = string
  description = "the IAM Profile name that can be used for ASG"

}

variable "lt_user_data" {
  type        = string
  description = "user data for install nginx and aws cli"

}



variable "all_tags" {
  description = "A map of tags to add to all resources"
  type        = map(any)
  default     = {}
}
