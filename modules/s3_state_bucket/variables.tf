variable "bucket" {
  description = "The name of the S3 bucket to store the Terraform state file"
  type        = string
}

variable "region" {
  description = "AWS region. Must be in string format like: us-west-2"
  type        = string
}