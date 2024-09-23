variable "BUCKET" {
  description = "The name of the S3 bucket to store the Terraform state file"
  type        = string
}

variable "REGION" {
  description = "AWS region. Must be in string format like: us-west-2"
  type        = string
}

variable "MY_IP_FIRST_THREE_BLOCKS" {
  description = "Your current IP block x.x.x.x/24"
  type        = string

  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){2}[0-9]{1,3}$", var.MY_IP_FIRST_THREE_BLOCKS))
    error_message = "The partial IP must be in the format x.x.x, with exactly three blocks of numbers separated by dots. On Mac, you can get your ip with 'curl -4 ifconfig.co'"
  }
}

variable "AWSLambdaBasicExecutionRole" {
  description = "The ARN of the AWSLambdaBasicExecutionRole"
  type        = string
  default     = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

variable "AmazonEC2ContainerServiceRole" {
  description = "The ARN of the AmazonEC2ContainerServiceRole"
  type        = string
  default     = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}

variable "AWSAppRunnerServicePolicyForECRAccess" {
  description = "The ARN of the AWSAppRunnerServicePolicyForECRAccess"
  type        = string
  default     = "arn:aws:iam::aws:policy/service-role/AWSAppRunnerServicePolicyForECRAccess"
}

variable "CloudWatchLogsFullAccess" {
  description = "The ARN of the CloudWatchLogsFullAccess"
  type        = string
  default     = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}

variable "CloudWatchFullAccessV2" {
  description = "The ARN of the CloudWatchFullAccessV2"
  type        = string
  default     = "arn:aws:iam::aws:policy/CloudWatchFullAccessV2"
}

variable "AmazonECSTaskExecutionRolePolicy" {
  description = "The ARN of the AmazonECSTaskExecutionRolePolicy"
  type        = string
  default     = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
