# Infarstructure
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

* 1.Frist cate S3 bucket to store terraform status in S3 with DynamoDB
* 2.Create the AWS VPC. This will create 2 Private AZs and 2 Public AZs in provided region (Note: You have to provide your custom CIDRs for Public and Private Subnet)
* 3.Create Security Groups for Public ALB and Parivate EC2 instance 
* 4.Create Launch Template
* 5.Deploy an ALB in the public subnet
* 6.Create the auto scaling group to scale up and down with the intance cpu utilization


## deployment
* 1. aws/accout_id/backend_s3_with_dynamodb/-> and  terrafrom init-> terrafrom plan -> terrafrom apply 
* 2. aws/accout_id/vpc_create/ -> and  terrafrom init-> terrafrom plan -> terrafrom apply  | chage the backend.tf s3 state path | Provide WAS variable (ex.tags) 
* 3. sg_create -> and  terrafrom init-> terrafrom plan -> terrafrom apply  | chage the backend.tf s3 state path | Provide WAS variable (ex.tags) 
* 4. aws/accout_id/launch_template -> and  terrafrom init-> terrafrom plan -> terrafrom apply | chage the backend.tf s3 state path | Provide WAS variable (ex.tags) 
* 5. aws/accout_idlb_for_asg -> and  terrafrom init-> terrafrom plan -> terrafrom apply | chage the backend.tf s3 state path | Provide WAS variable (ex.tags) 
* 6. aws/accout_id/al-> and  terrafrom init-> terrafrom plan -> terrafrom apply | chage the backend.tf s3 state path | Provide WAS variable (ex.tags) 

