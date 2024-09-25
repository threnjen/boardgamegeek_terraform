resource "aws_iam_policy" "S3_Access_boardgamegeek_scraper" {
  name = "S3_Access_boardgamegeek_scraper"
  path = "/"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:ListBucket",
          "s3:PutObject",
          "s3:GetObject"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:s3:::boardgamegeek_scraper"
      },
      { Action = [
        "s3:ListAllMyBuckets"
        ]
        Effect = "Allow"
      Resource = "*" }
    ]
  })
}

resource "aws_iam_policy" "Cloudwatch_Put_Metrics" {
  name = "Cloudwatch_Put_Metrics"
  path = "/"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "VisualEditor0",
        Effect = "Allow",
        Action = [
          "cloudwatch:PutMetricAlarm",
          "cloudwatch:PutMetricData"
        ],
        Resource = "*"
      }
    ]
  })
}



resource "aws_iam_policy" "boardgamegeek_cleaner_fargate_trigger_cloudwatch" {
  name = "boardgamegeek_cleaner_fargate_trigger_cloudwatch"
  path = "/"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "logs:CreateLogGroup",
        Resource = "arn:aws:logs:${var.REGION}:${data.aws_caller_identity.current.account_id}:*"
      },
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = [
          "arn:aws:logs:${var.REGION}:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/boardgamegeek_cleaner_fargate_trigger:*",
          "arn:aws:logs:${var.REGION}:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/boardgamegeek_cleaner_fargate_trigger:*"
        ]
      }
    ]
  })
}

resource "aws_iam_policy" "boardgame_scraper_fargate_trigger_cloudwatch" {
  name = "boardgame_scraper_fargate_trigger_cloudwatch"
  path = "/"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "logs:CreateLogGroup",
        Resource = "arn:aws:logs:${var.REGION}:${data.aws_caller_identity.current.account_id}:*"
      },
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = [
          "arn:aws:logs:${var.REGION}:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/boardgame_scraper_fargate_trigger_dev:*",
          "arn:aws:logs:${var.REGION}:${data.aws_caller_identity.current.account_id}:log-group:/aws/lambda/boardgame_scraper_fargate_trigger:*"
        ]
      }
    ]
  })
}

resource "aws_iam_policy" "bgg-scraper-describe-task-def" {
  name = "bgg-scraper-describe-task-def"
  path = "/"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "VisualEditor0",
        Effect = "Allow",
        Action = "ecs:DescribeTasks",
        Resource = [
          "arn:aws:ecs:${var.REGION}:${data.aws_caller_identity.current.account_id}:task/*/boardgamegeek_scraper",
          "arn:aws:ecs:${var.REGION}:${data.aws_caller_identity.current.account_id}:task-definition/boardgamegeek_scraper:*",
          "arn:aws:ecs:${var.REGION}:${data.aws_caller_identity.current.account_id}:task/*/boardgamegeek_scraper_dev",
          "arn:aws:ecs:${var.REGION}:${data.aws_caller_identity.current.account_id}:task-definition/boardgamegeek_scraper_dev:*"
        ]
      },
      {
        Sid      = "VisualEditor1",
        Effect   = "Allow",
        Action   = "ecs:DescribeTaskDefinition",
        Resource = "*"
      },
      {
        Sid    = "VisualEditor2",
        Effect = "Allow",
        Action = "ecs:RunTask",
        Resource = [
          "arn:aws:ecs:${var.REGION}:${data.aws_caller_identity.current.account_id}:task-definition/boardgamegeek_scraper:*",
          "arn:aws:ecs:${var.REGION}:${data.aws_caller_identity.current.account_id}:task-definition/boardgamegeek_scraper_dev:*"
        ]
      },
      {
        Sid    = "VisualEditor3",
        Effect = "Allow",
        Action = "iam:PassRole",
        Resource = [
          "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/boardgamegeek_scraper_FargateExecutionRole",
          "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/boardgamegeek_scraper_FargateTaskRole"
        ]
      }
    ]
  })
}

resource "aws_iam_policy" "bgg-cleaner-describe-task-def" {
  name = "bgg-cleaner-describe-task-def"
  path = "/"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "VisualEditor0",
        Effect = "Allow",
        Action = "ecs:DescribeTasks",
        Resource = [
          "arn:aws:ecs:${var.REGION}:${data.aws_caller_identity.current.account_id}:task/*/boardgamegeek_cleaner",
          "arn:aws:ecs:${var.REGION}:${data.aws_caller_identity.current.account_id}:task-definition/boardgamegeek_cleaner:*",
          "arn:aws:ecs:${var.REGION}:${data.aws_caller_identity.current.account_id}:task/*/boardgamegeek_cleaner_dev",
          "arn:aws:ecs:${var.REGION}:${data.aws_caller_identity.current.account_id}:task-definition/boardgamegeek_cleaner_dev:*"
        ]
      },
      {
        Sid      = "VisualEditor1",
        Effect   = "Allow",
        Action   = "ecs:DescribeTaskDefinition",
        Resource = "*"
      },
      {
        Sid    = "VisualEditor2",
        Effect = "Allow",
        Action = "ecs:RunTask",
        Resource = [
          "arn:aws:ecs:${var.REGION}:${data.aws_caller_identity.current.account_id}:task-definition/boardgamegeek_cleaner:*",
          "arn:aws:ecs:${var.REGION}:${data.aws_caller_identity.current.account_id}:task-definition/boardgamegeek_cleaner_dev:*"
        ]
      },
      {
        Sid    = "VisualEditor3",
        Effect = "Allow",
        Action = "iam:PassRole",
        Resource = [
          "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/boardgamegeek_cleaner_FargateExecutionRole",
          "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/boardgamegeek_cleaner_FargateTaskRole"
        ]
      }
    ]
  })
}