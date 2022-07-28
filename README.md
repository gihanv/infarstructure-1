# infarstructure
Terraform deployment for apache
# Tnfarstructure
Terraform deployment for apache auto sacling group

## Tools Needs
Terrafor>=0.13

An in-depth paragraph about your project and overview of use.

## Getting Started

### Moudle I have used

* VPC
* DymamoDB
* DymamoDB
* Security Group
* Auto Scaling Group
* Launch Template

### Installing

* Frist cate S3 bucket to stor terraform status in S3 with DynamoDB
* Create the Aws VPC. This will create 2 Private AZs and 2 Public AZs in provided region (Note: You have to prvide your custom CIDRs for Public and Private Subnet)
* Create Security Groups for Public ALB and Parivate EC2 instance 
* Create Laumch Template
* Create Auto scaling group
* Associate With ALB

## deployment
** cd aws/accout_id/backend_s3_with_dynamodb/ and Provide your variable and  terrafrom init, plan , apply
** cd aws/accout_id/vpc_create/ and Provide your variable and  terrafrom init, plan , apply
** cd sg_create
** cd aws/accout_id/launch_template
** cd aws/accout_id/asc
** cd aws/accout_idlb_for_asg
