resource "aws_iam_policy" "bucket_policy" {
  name = var.lt_am_policy
  path = "/"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "VisualEditor0",
        "Effect" : "Allow",
        "Action" : [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListBucket",
          "s3:DeleteObject"
        ],
        "Resource" : [
          "arn:aws:s3:::*/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role" "s3_full_access_role" {
  name = var.lt_am_role

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

}


resource "aws_iam_role_policy_attachment" "policy" {
  role       = aws_iam_role.s3_full_access_role.name
  policy_arn = aws_iam_policy.bucket_policy.arn
}


resource "aws_iam_instance_profile" "s3_profile" {
  name = var.lt_iam_instance_profile
  role = aws_iam_role.s3_full_access_role.name

  depends_on = [
    aws_iam_role.s3_full_access_role
  ]

}

resource "aws_launch_template" "auto" {
  name = var.lt_name

  block_device_mappings {
    device_name = var.lt_ebs_path

    ebs {
      volume_size = var.lt_ebs_size
    }
  }

  credit_specification {
    cpu_credits = var.lt_credit_specification
  }


  disable_api_termination = var.lt_disable_api_termination

  iam_instance_profile {
    name = var.lt_iam_instance_profile
  }

  image_id                             = var.lt_image_id
  instance_initiated_shutdown_behavior = var.lt_instance_initiated_shutdown_behavior
  instance_type                        = var.lt_instance_type
  key_name                             = var.lt_key_name

  monitoring {
    enabled = true
  }
  network_interfaces {
    #associate_public_ip_address = var.lt_public_ip
    associate_public_ip_address = true
  }

#security_group_names  = [data.aws_security_groups.test.ids[0],data.aws_security_groups.test.ids[0]]

  #vpc_security_group_ids = [data.aws_security_groups.test.ids[0]]
  #vpc_security_group_ids = [data.aws_security_groups.test.ids[0], data.aws_security_groups.test.ids[1]]
  #vpc_security_group_ids = ["sg-05d67a19d8e2e618b"]

  tag_specifications {
    resource_type = "instance"

    tags = merge(tomap({ "Name" = format("%s", var.lt_name) }),
    var.all_tags)
  }

  user_data = var.lt_user_data

  depends_on = [
    aws_iam_instance_profile.s3_profile
  ]
}
