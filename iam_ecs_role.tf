module "boardgamegeek_cleaner_FargateExecutionRole" {
  source          = "./modules/iam_ecs_roles"
  task_definition = "boardgamegeek_cleaner_FargateExecutionRole"
}

resource "aws_iam_role_policy_attachment" "S3_Access_boardgamegeek_cleaner_FargateExecutionRole" {
  role       = module.boardgamegeek_cleaner_FargateExecutionRole.name
  policy_arn = aws_iam_policy.S3_Access_boardgamegeek_scraper.arn
}

module "boardgamegeek_cleaner_FargateTaskRole" {
  source          = "./modules/iam_ecs_roles"
  task_definition = "boardgamegeek_cleaner_FargateTaskRole"
}

resource "aws_iam_role_policy_attachment" "S3_Access_boardgamegeekboardgamegeek_cleaner_FargateTaskRole" {
  role       = module.boardgamegeek_cleaner_FargateTaskRole.name
  policy_arn = aws_iam_policy.S3_Access_boardgamegeek_scraper.arn
}

resource "aws_iam_role_policy_attachment" "Cloudwatch_Put_Metricsboardgamegeek_cleaner_FargateTaskRole" {
  role       = module.boardgamegeek_cleaner_FargateTaskRole.name
  policy_arn = aws_iam_policy.Cloudwatch_Put_Metrics.arn
}

module "boardgamegeek_scraper_FargateExecutionRole" {
  source          = "./modules/iam_ecs_roles"
  task_definition = "boardgamegeek_scraper_FargateExecutionRole"
}
resource "aws_iam_role_policy_attachment" "S3_Access_boardgamegeek_scraperboardgamegeek_scraper_FargateExecutionRole" {
  role       = module.boardgamegeek_scraper_FargateExecutionRole.name
  policy_arn = aws_iam_policy.S3_Access_boardgamegeek_scraper.arn
}

module "boardgamegeek_scraper_FargateTaskRole" {
  source          = "./modules/iam_ecs_roles"
  task_definition = "boardgamegeek_scraper_FargateTaskRole"
}
resource "aws_iam_role_policy_attachment" "S3_Access_boardgamegeekboardgamegeek_scraper_FargateTaskRole" {
  role       = module.boardgamegeek_scraper_FargateTaskRole.name
  policy_arn = aws_iam_policy.S3_Access_boardgamegeek_scraper.arn
}

resource "aws_iam_role_policy_attachment" "Cloudwatch_Put_Metricsboardgamegeek_scraper_FargateTaskRole" {
  role       = module.boardgamegeek_scraper_FargateTaskRole.name
  policy_arn = aws_iam_policy.Cloudwatch_Put_Metrics.arn
}
