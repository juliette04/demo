# #s3 jluma data

# # resource "aws_s3_bucket" "jluma" {
# #   bucket = "myluma-bucket"

# #   tags = {
# #     Name        = "My bucket"
# #     Environment = "Dev"
# #   }
# # }

# # resource "aws_s3_bucket_acl" "example" {
# #   bucket = aws_s3_bucket.jluma.id
# #   acl    = "private"
# # }

# # resource "aws_s3_bucket_object" "S3SingleObject" {
# #     bucket = aws_s3_bucket.jluma.id
# #     key = "file.txt"
# #     source = "C:\\Users\\User\\Desktop\\file.txt"

# # }

# # resource "aws_s3_object" "S3MultiObject" {
# #     bucket = aws_s3_bucket.jluma.id
# #     for_each = fileset("C:\\Users\\User\\Desktop\\Test.txt", "*")
# #     key = each.value
# #     source = "C:\\Users\\User\\Desktop\\Test.txt\\${each.value}"

# # }

# # resource "aws_s3_bucket_object" "S3Objects-inside-dir" {
# #     bucket = aws_s3_bucket.jluma.id
# #     for_each = fileset("C:\\Users\\User\\Desktop\\Test.txt","*")
# #     key = "${var.named_folder}/${each.value}"
# #     source = "C:\\Users\\User\\Desktop\\Test.txt\\${each.value}"

# # }

# #bucket access lock
# # resource "aws_s3_bucket" "myluma-bucket1" {
# #   bucket = "myluma-bucket1"
# # }

# # resource "aws_s3_bucket_public_access_block" "myluma-bucket1" {
# #   bucket = aws_s3_bucket.myluma-bucket1.id
# #   block_public_acls       = true
# #   block_public_policy     = true
# #   ignore_public_acls      = true
# #   restrict_public_buckets = true
# # }


# # Creating New Origin Access Identity
# resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
#   comment = "new-acess-identity"
# }
 
# # Creating new S3 bucket 
# resource "aws_s3_bucket" "my_bucket" {

#   bucket = "jbihbucket4-efs"  #Enter unique name here
#   acl    = "private"
#   tags = {
#     Name        = "My bucket"
#   }
# }

# # Bucket Policy for allowing acess to cloudfront distribution
# resource "aws_s3_bucket_policy" "my_bucket_policy" {
#   bucket = aws_s3_bucket.my_bucket.id

#   policy = <<POLICY
# {
#     "Version": "2012-10-17",
#     "Id": "PolicyForCloudFrontPrivateContent",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "Principal": {
#                 "AWS": "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity ${aws_cloudfront_origin_access_identity.origin_access_identity.id}"
#             },
#             "Action": "s3:GetObject",
#             "Resource": "arn:aws:s3:::${aws_s3_bucket.my_bucket.bucket}/*"
#         }
#     ]
# }
# POLICY
# }

# # Storing Objects in S3 bucket 
# resource "aws_s3_bucket_object" "object" {
#   acl = "public-read"
#   depends_on = [aws_s3_bucket.my_bucket]
#   bucket = aws_s3_bucket.my_bucket.id
#   key    = "pic.html"
#   source = "C:\\Users\\User\\Pictures\\pic.html.jpg"   # Provide exact path of your file
# }

# locals {
#   s3_origin_id = "myS3Origin"
# }

# # Creating CloudFront Distribution 
# resource "aws_cloudfront_distribution" "s3_distribution" {
#   origin {
#     domain_name = aws_s3_bucket.my_bucket.bucket_regional_domain_name
#     origin_id   = local.s3_origin_id
  
# s3_origin_config {
#   origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
#     }

#   }
 
#   enabled             = true
#   is_ipv6_enabled     = true

#   default_cache_behavior {
#     allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
#     cached_methods   = ["GET", "HEAD"]
#     target_origin_id = local.s3_origin_id

#     forwarded_values {
#       query_string = false

#       cookies {
#         forward = "none"
#       }
#     }

#     viewer_protocol_policy = "allow-all"
#     min_ttl                = 0
#     default_ttl            = 3600
#     max_ttl                = 86400
#   }

#   # Cache behavior with precedence 0
#   ordered_cache_behavior {
#     path_pattern     = "/content/immutable/*"
#     allowed_methods  = ["GET", "HEAD", "OPTIONS"]
#     cached_methods   = ["GET", "HEAD", "OPTIONS"]
#     target_origin_id = local.s3_origin_id

#     forwarded_values {
#       query_string = false
#       headers      = ["Origin"]

#       cookies {
#         forward = "none"
#       }
#     }

#     min_ttl                = 0
#     default_ttl            = 86400
#     max_ttl                = 31536000
#     compress               = true
#     viewer_protocol_policy = "redirect-to-https"
#   }

#   # Cache behavior with precedence 1
#   ordered_cache_behavior {
#     path_pattern     = "/content/*"
#     allowed_methods  = ["GET", "HEAD", "OPTIONS"]
#     cached_methods   = ["GET", "HEAD"]
#     target_origin_id = local.s3_origin_id

#     forwarded_values {
#       query_string = false

#       cookies {
#         forward = "none"
#       }
#     }

#     min_ttl                = 0
#     default_ttl            = 3600
#     max_ttl                = 86400
#     compress               = true
#     viewer_protocol_policy = "redirect-to-https"
#   }

#   price_class = "PriceClass_All"

#   restrictions {
#     geo_restriction {
#       restriction_type = "none"
#     }
#   }

#   tags = {
#     Environment = "production"
#   }

#   viewer_certificate {
#     cloudfront_default_certificate = true
#   }
# }

# # Retrieve CloudFront Domain 
# resource "null_resource" "CloudFront_Domain" {
#   depends_on = [aws_cloudfront_distribution.s3_distribution]

#   provisioner "local-exec" {
#     command = "echo ${aws_cloudfront_distribution.s3_distribution.domain_name} > CloudFrontURL.txt" 
#   }
# }