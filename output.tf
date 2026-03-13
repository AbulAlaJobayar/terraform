# output "instance_public_ip" {
#   value = aws_instance.myec2.public_ip
# }



# conditional expression and locals
# output "name_tag" {
#   value = local.name_tag
# }


#  Resource Dependencies & depends_on

# output "bucket_name" {
#   value = aws_s3_bucket.my_bucket.id
# }
# workspace 

output "terraform_workspace"{
value = terraform.workspace
}


