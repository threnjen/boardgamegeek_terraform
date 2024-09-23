resource "aws_ecs_cluster" "boardgamegeek" {
  name = "boardgamegeek"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

variable "s3_scraper_task_bucket" {
  description = "The name of the S3 bucket to store the scraper task"
  type        = string
  default = "boardgamegeek-scraper"
}

variable "boardgamegeek-cleaner" {
  description = "The name of the ECS task definition for the boardgamegeek-cleaner"
  type        = string
  default = "boardgamegeek-cleaner"
}

variable "boardgamegeek-scraper" {
  description = "The name of the ECS task definition for the boardgamegeek-scraper"
  type        = string
  default = "boardgamegeek-scraper"
}

module "boardgamegeek-cleaner" {
    source = "./modules/ecs_task_definition"
    task_definition_family=var.boardgamegeek-cleaner
    task_definition_name =var.boardgamegeek-cleaner
    registry_name="${data.aws_caller_identity.current.account_id}.dkr.ecr.us-west-2.amazonaws.com/${var.boardgamegeek-cleaner}:latest"
    environment="prod"
    env_file="arn:aws:s3:::${var.s3_scraper_task_bucket}/${var.boardgamegeek-cleaner}.env"
    task_role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.boardgamegeek-cleaner}_FargateTaskRole"
    execution_role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.boardgamegeek-cleaner}_FargateExecutionRole"
    image = "${data.aws_caller_identity.current.account_id}.dkr.ecr.us-west-2.amazonaws.com/${var.boardgamegeek-cleaner}:latest"
    cpu ="2048"
    memory ="16384"
    region = var.region
}

module "boardgamegeek-cleaner_dev" {
    source = "./modules/ecs_task_definition"
    task_definition_family="${var.boardgamegeek-cleaner}_dev"
    task_definition_name ="${var.boardgamegeek-cleaner}_dev"
    registry_name="${data.aws_caller_identity.current.account_id}.dkr.ecr.us-west-2.amazonaws.com/${var.boardgamegeek-cleaner}_dev:latest"
    environment="dev"
    env_file="arn:aws:s3:::${var.s3_scraper_task_bucket}/${var.boardgamegeek-cleaner}.env"
    task_role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.boardgamegeek-cleaner}_FargateTaskRole"
    execution_role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.boardgamegeek-cleaner}_FargateExecutionRole"
    image = "${data.aws_caller_identity.current.account_id}.dkr.ecr.us-west-2.amazonaws.com/${var.boardgamegeek-cleaner}_dev:latest"
    cpu ="2048"
    memory ="16384"
    region = var.region
}

module "boardgamegeek-scraper" {
    source = "./modules/ecs_task_definition"
    task_definition_family=var.boardgamegeek-scraper
    task_definition_name =var.boardgamegeek-scraper
    registry_name="${data.aws_caller_identity.current.account_id}.dkr.ecr.us-west-2.amazonaws.com/${var.boardgamegeek-scraper}:latest"
    environment="prod"
    env_file="arn:aws:s3:::${var.s3_scraper_task_bucket}/${var.boardgamegeek-scraper}.env"
    task_role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.boardgamegeek-scraper}_FargateTaskRole"
    execution_role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.boardgamegeek-scraper}_FargateExecutionRole"
    image = "${data.aws_caller_identity.current.account_id}.dkr.ecr.us-west-2.amazonaws.com/${var.boardgamegeek-scraper}:latest"
    cpu ="256"
    memory ="2048"
    region = var.region
}

module "boardgamegeek-scraper_dev" {
    source = "./modules/ecs_task_definition"
    task_definition_family="${var.boardgamegeek-scraper}_dev"
    task_definition_name ="${var.boardgamegeek-scraper}_dev"
    registry_name="${data.aws_caller_identity.current.account_id}.dkr.ecr.us-west-2.amazonaws.com/${var.boardgamegeek-scraper}:latest"
    environment="prod"
    env_file="arn:aws:s3:::${var.s3_scraper_task_bucket}/${var.boardgamegeek-scraper}.env"
    task_role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.boardgamegeek-scraper}_FargateTaskRole"
    execution_role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.boardgamegeek-scraper}_FargateExecutionRole"
    image = "${data.aws_caller_identity.current.account_id}.dkr.ecr.us-west-2.amazonaws.com/${var.boardgamegeek-scraper}_dev:latest"
    cpu ="256"
    memory ="2048"
    region = var.region
}

# module "" {
#     source = "./modules/ecs_task_definition"
#     task_definition_family=
#     task_definition_name =
#     registry_name="${data.aws_caller_identity.current.account_id}.dkr.ecr.us-west-2.amazonaws.com/${}:latest"
#     environment="prod"
#     env_file="arn:aws:s3:::${var.s3_scraper_task_bucket}/${}.env"
#     task_role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${}_FargateTaskRole"
#     execution_role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${}_FargateExecutionRole"
#     cpu ="2048"
#     memory ="16384"
#     region = var.region
# }
