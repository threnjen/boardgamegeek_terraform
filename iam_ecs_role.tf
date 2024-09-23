data "aws_iam_policy_document" "assume_role_ecs" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "boardgamegeek-cleaner_FargateExecutionRole" {
  name               = "boardgamegeek-cleaner_FargateExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role_ecs.json
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerServiceRoleboardgamegeek-cleaner_FargateExecutionRole" {
  role       = aws_iam_role.boardgamegeek-cleaner_FargateExecutionRole.name
  policy_arn = var.AmazonEC2ContainerServiceRole
}

resource "aws_iam_role_policy_attachment" "AWSAppRunnerServicePolicyForECRAccessboardgamegeek-cleaner_FargateExecutionRole" {
  role       = aws_iam_role.boardgamegeek-cleaner_FargateExecutionRole.name
  policy_arn = var.AWSAppRunnerServicePolicyForECRAccess
}

resource "aws_iam_role_policy_attachment" "CloudWatchLogsFullAccessboardgamegeek-cleaner_FargateExecutionRole" {
  role       = aws_iam_role.boardgamegeek-cleaner_FargateExecutionRole.name
  policy_arn = var.CloudWatchLogsFullAccess
}

resource "aws_iam_role_policy_attachment" "CloudWatchFullAccessV2boardgamegeek-cleaner_FargateExecutionRole" {
  role       = aws_iam_role.boardgamegeek-cleaner_FargateExecutionRole.name
  policy_arn = var.CloudWatchFullAccessV2
}

resource "aws_iam_role_policy_attachment" "S3_Access_boardgamegeekboardgamegeek-cleaner_FargateExecutionRole" {
  role       = aws_iam_role.boardgamegeek-cleaner_FargateExecutionRole.name
  policy_arn = aws_iam_policy.S3_Access_boardgamegeek_scraper.arn
}



resource "aws_iam_role" "boardgamegeek-cleaner_FargateTaskRole" {
  name               = "boardgamegeek-cleaner_FargateTaskRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role_ecs.json
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerServiceRoleboardgamegeek-cleaner_FargateTaskRole" {
  role       = aws_iam_role.boardgamegeek-cleaner_FargateTaskRole.name
  policy_arn = var.AmazonEC2ContainerServiceRole
}

resource "aws_iam_role_policy_attachment" "AmazonECSTaskExecutionRolePolicyboardgamegeek-cleaner_FargateTaskRole" {
  role       = aws_iam_role.boardgamegeek-cleaner_FargateTaskRole.name
  policy_arn = var.AmazonECSTaskExecutionRolePolicy
}

resource "aws_iam_role_policy_attachment" "S3_Access_boardgamegeekboardgamegeek-cleaner_FargateTaskRole" {
  role       = aws_iam_role.boardgamegeek-cleaner_FargateTaskRole.name
  policy_arn = aws_iam_policy.S3_Access_boardgamegeek_scraper.arn
}

resource "aws_iam_role_policy_attachment" "Cloudwatch_Put_Metricsboardgamegeek-cleaner_FargateTaskRole" {
  role       = aws_iam_role.boardgamegeek-cleaner_FargateTaskRole.name
  policy_arn = aws_iam_policy.Cloudwatch_Put_Metrics.arn
}

resource "aws_iam_role" "boardgamegeek-scraper_FargateExecutionRole" {
  name               = "boardgamegeek-scraper_FargateExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role_ecs.json
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerServiceRoleboardgamegeek-scraper_FargateExecutionRole" {
  role       = aws_iam_role.boardgamegeek-scraper_FargateExecutionRole.name
  policy_arn = var.AmazonEC2ContainerServiceRole
}

resource "aws_iam_role_policy_attachment" "AWSAppRunnerServicePolicyForECRAccessboardgamegeek-scraper_FargateExecutionRole" {
  role       = aws_iam_role.boardgamegeek-scraper_FargateExecutionRole.name
  policy_arn = var.AWSAppRunnerServicePolicyForECRAccess
}

resource "aws_iam_role_policy_attachment" "CloudWatchLogsFullAccessboardgamegeek-scraper_FargateExecutionRole" {
  role       = aws_iam_role.boardgamegeek-scraper_FargateExecutionRole.name
  policy_arn = var.CloudWatchLogsFullAccess
}

resource "aws_iam_role_policy_attachment" "CloudWatchFullAccessV2boardgamegeek-scraper_FargateExecutionRole" {
  role       = aws_iam_role.boardgamegeek-scraper_FargateExecutionRole.name
  policy_arn = var.CloudWatchFullAccessV2
}

resource "aws_iam_role_policy_attachment" "S3_Access_boardgamegeek_scraperboardgamegeek-scraper_FargateExecutionRole" {
  role       = aws_iam_role.boardgamegeek-scraper_FargateExecutionRole.name
  policy_arn = aws_iam_policy.S3_Access_boardgamegeek_scraper.arn
}

resource "aws_iam_role" "boardgamegeek-scraper_FargateTaskRole" {
  name               = "boardgamegeek-scraper_FargateTaskRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role_ecs.json
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerServiceRoleboardgamegeek-scraper_FargateTaskRole" {
  role       = aws_iam_role.boardgamegeek-scraper_FargateTaskRole.name
  policy_arn = var.AmazonEC2ContainerServiceRole
}

resource "aws_iam_role_policy_attachment" "AmazonECSTaskExecutionRolePolicyboardgamegeek-scraper_FargateTaskRole" {
  role       = aws_iam_role.boardgamegeek-scraper_FargateTaskRole.name
  policy_arn = var.AmazonECSTaskExecutionRolePolicy
}

resource "aws_iam_role_policy_attachment" "S3_Access_boardgamegeekboardgamegeek-scraper_FargateTaskRole" {
  role       = aws_iam_role.boardgamegeek-scraper_FargateTaskRole.name
  policy_arn = aws_iam_policy.S3_Access_boardgamegeek_scraper.arn
}

resource "aws_iam_role_policy_attachment" "Cloudwatch_Put_Metricsboardgamegeek-scraper_FargateTaskRole" {
  role       = aws_iam_role.boardgamegeek-scraper_FargateTaskRole.name
  policy_arn = aws_iam_policy.Cloudwatch_Put_Metrics.arn
}
