# # module "ec2" {
# #   source = "../module/ec2"
# #   ami_id_module = "module-ami"
# #   instance_type_module = "t3.small"
# #   security-group = module.security-group.sec-id
# # }


# # module "vpc" {
# #   source = "../module/vpc"
# # }

# # module "security-group" {
# #   source = "../module/security-group"

# # }

# # module "s3_bucket" {
# #   source = "terraform-aws-modules/s3-bucket/aws"

# #   bucket = "my-s3-bucket"
# #   acl    = "private"

# #   versioning = {
# #     enabled = true
# #   }

# # }

# #module
module "vpc1" {
  source = "../module/vpc"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"
}