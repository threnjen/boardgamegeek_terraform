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

resource "aws_iam_role" "boardgamegeek_cleaner_FargateExecutionRole" {
  name               = "boardgamegeek_cleaner_FargateExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role_ecs.json
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerServiceRoleboardgamegeek_cleaner_FargateExecutionRole" {
  role       = aws_iam_role.boardgamegeek_cleaner_FargateExecutionRole.name
  policy_arn = var.AmazonEC2ContainerServiceRole
}

resource "aws_iam_role_policy_attachment" "AWSAppRunnerServicePolicyForECRAccessboardgamegeek_cleaner_FargateExecutionRole" {
  role       = aws_iam_role.boardgamegeek_cleaner_FargateExecutionRole.name
  policy_arn = var.AWSAppRunnerServicePolicyForECRAccess
}

resource "aws_iam_role_policy_attachment" "CloudWatchLogsFullAccessboardgamegeek_cleaner_FargateExecutionRole" {
  role       = aws_iam_role.boardgamegeek_cleaner_FargateExecutionRole.name
  policy_arn = var.CloudWatchLogsFullAccess
}

resource "aws_iam_role_policy_attachment" "CloudWatchFullAccessV2boardgamegeek_cleaner_FargateExecutionRole" {
  role       = aws_iam_role.boardgamegeek_cleaner_FargateExecutionRole.name
  policy_arn = var.CloudWatchFullAccessV2
}

resource "aws_iam_role_policy_attachment" "S3_Access_boardgamegeekboardgamegeek_cleaner_FargateExecutionRole" {
  role       = aws_iam_role.boardgamegeek_cleaner_FargateExecutionRole.name
  policy_arn = aws_iam_policy.S3_Access_boardgamegeek_scraper.arn
}



resource "aws_iam_role" "boardgamegeek_cleaner_FargateTaskRole" {
  name               = "boardgamegeek_cleaner_FargateTaskRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role_ecs.json
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerServiceRoleboardgamegeek_cleaner_FargateTaskRole" {
  role       = aws_iam_role.boardgamegeek_cleaner_FargateTaskRole.name
  policy_arn = var.AmazonEC2ContainerServiceRole
}

resource "aws_iam_role_policy_attachment" "AmazonECSTaskExecutionRolePolicyboardgamegeek_cleaner_FargateTaskRole" {
  role       = aws_iam_role.boardgamegeek_cleaner_FargateTaskRole.name
  policy_arn = var.AmazonECSTaskExecutionRolePolicy
}

resource "aws_iam_role_policy_attachment" "S3_Access_boardgamegeekboardgamegeek_cleaner_FargateTaskRole" {
  role       = aws_iam_role.boardgamegeek_cleaner_FargateTaskRole.name
  policy_arn = aws_iam_policy.S3_Access_boardgamegeek_scraper.arn
}

resource "aws_iam_role_policy_attachment" "Cloudwatch_Put_Metricsboardgamegeek_cleaner_FargateTaskRole" {
  role       = aws_iam_role.boardgamegeek_cleaner_FargateTaskRole.name
  policy_arn = aws_iam_policy.Cloudwatch_Put_Metrics.arn
}

resource "aws_iam_role" "boardgamegeek_scraper_FargateExecutionRole" {
  name               = "boardgamegeek_scraper_FargateExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role_ecs.json
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerServiceRoleboardgamegeek_scraper_FargateExecutionRole" {
  role       = aws_iam_role.boardgamegeek_scraper_FargateExecutionRole.name
  policy_arn = var.AmazonEC2ContainerServiceRole
}

resource "aws_iam_role_policy_attachment" "AWSAppRunnerServicePolicyForECRAccessboardgamegeek_scraper_FargateExecutionRole" {
  role       = aws_iam_role.boardgamegeek_scraper_FargateExecutionRole.name
  policy_arn = var.AWSAppRunnerServicePolicyForECRAccess
}

resource "aws_iam_role_policy_attachment" "CloudWatchLogsFullAccessboardgamegeek_scraper_FargateExecutionRole" {
  role       = aws_iam_role.boardgamegeek_scraper_FargateExecutionRole.name
  policy_arn = var.CloudWatchLogsFullAccess
}

resource "aws_iam_role_policy_attachment" "CloudWatchFullAccessV2boardgamegeek_scraper_FargateExecutionRole" {
  role       = aws_iam_role.boardgamegeek_scraper_FargateExecutionRole.name
  policy_arn = var.CloudWatchFullAccessV2
}

resource "aws_iam_role_policy_attachment" "S3_Access_boardgamegeek_scraperboardgamegeek_scraper_FargateExecutionRole" {
  role       = aws_iam_role.boardgamegeek_scraper_FargateExecutionRole.name
  policy_arn = aws_iam_policy.S3_Access_boardgamegeek_scraper.arn
}

resource "aws_iam_role" "boardgamegeek_scraper_FargateTaskRole" {
  name               = "boardgamegeek_scraper_FargateTaskRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role_ecs.json
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerServiceRoleboardgamegeek_scraper_FargateTaskRole" {
  role       = aws_iam_role.boardgamegeek_scraper_FargateTaskRole.name
  policy_arn = var.AmazonEC2ContainerServiceRole
}

resource "aws_iam_role_policy_attachment" "AmazonECSTaskExecutionRolePolicyboardgamegeek_scraper_FargateTaskRole" {
  role       = aws_iam_role.boardgamegeek_scraper_FargateTaskRole.name
  policy_arn = var.AmazonECSTaskExecutionRolePolicy
}

resource "aws_iam_role_policy_attachment" "S3_Access_boardgamegeekboardgamegeek_scraper_FargateTaskRole" {
  role       = aws_iam_role.boardgamegeek_scraper_FargateTaskRole.name
  policy_arn = aws_iam_policy.S3_Access_boardgamegeek_scraper.arn
}

resource "aws_iam_role_policy_attachment" "Cloudwatch_Put_Metricsboardgamegeek_scraper_FargateTaskRole" {
  role       = aws_iam_role.boardgamegeek_scraper_FargateTaskRole.name
  policy_arn = aws_iam_policy.Cloudwatch_Put_Metrics.arn
}
