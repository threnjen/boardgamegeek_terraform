data "aws_iam_policy_document" "assume_role_lambda" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "bgg_boardgame_file_retrieval_role" {
  name               = "bgg_boardgame_file_retrieval_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_lambda.json
}

resource "aws_iam_role_policy_attachment" "bgg_boardgame_file_retrieval_lambda" {
  role       = aws_iam_role.bgg_boardgame_file_retrieval_role.name
  policy_arn = var.AWSLambdaBasicExecutionRole
}
resource "aws_iam_role_policy_attachment" "bgg_boardgame_file_retrieval" {
  role       = aws_iam_role.bgg_boardgame_file_retrieval_role.name
  policy_arn = aws_iam_policy.S3_Access_boardgamegeek_scraper.arn
}

resource "aws_iam_role" "bgg_generate_game_urls_lambda_role" {
  name               = "bgg_generate_game_urls_lambda_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_lambda.json
}

resource "aws_iam_role_policy_attachment" "bgg_generate_game_urls_lambda_role_aws" {
  role       = aws_iam_role.bgg_generate_game_urls_lambda_role.name
  policy_arn = var.AWSLambdaBasicExecutionRole
}

resource "aws_iam_role_policy_attachment" "bgg_generate_game_urls_lambda_role" {
  role       = aws_iam_role.bgg_generate_game_urls_lambda_role.name
  policy_arn = aws_iam_policy.S3_Access_boardgamegeek_scraper.arn
}

resource "aws_iam_role" "bgg_generate_user_urls_lambda" {
  name               = "bgg_generate_user_urls_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role_lambda.json
}

resource "aws_iam_role_policy_attachment" "bgg_generate_user_urls_lambda_aws" {
  role       = aws_iam_role.bgg_generate_user_urls_lambda.name
  policy_arn = var.AWSLambdaBasicExecutionRole
}

resource "aws_iam_role_policy_attachment" "bgg_generate_user_urls_lambda" {
  role       = aws_iam_role.bgg_generate_user_urls_lambda.name
  policy_arn = aws_iam_policy.S3_Access_boardgamegeek_scraper.arn
}

resource "aws_iam_role" "boardgamegeek_scraper_fargate_trigger_role" {
  name               = "boardgamegeek_scraper_fargate_trigger_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_lambda.json
}

resource "aws_iam_role_policy_attachment" "boardgamegeek_scraper_describe" {
  role       = aws_iam_role.boardgamegeek_scraper_fargate_trigger_role.name
  policy_arn = aws_iam_policy.bgg-scraper-describe-task-def.arn
}

resource "aws_iam_role_policy_attachment" "boardgamegeek_scraper_cloudwatch" {
  role       = aws_iam_role.boardgamegeek_scraper_fargate_trigger_role.name
  policy_arn = aws_iam_policy.boardgame_scraper_fargate_trigger_cloudwatch.arn
}

resource "aws_iam_role_policy_attachment" "boardgamegeek_scraper_S3" {
  role       = aws_iam_role.boardgamegeek_scraper_fargate_trigger_role.name
  policy_arn = aws_iam_policy.S3_Access_boardgamegeek_scraper.arn
}

resource "aws_iam_role" "boardgamegeek_cleaner_fargate_trigger_role" {
  name               = "boardgamegeek_cleaner_fargate_trigger_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_lambda.json
}

resource "aws_iam_role_policy_attachment" "boardgamegeek_cleaner_cloudwatch" {
  role       = aws_iam_role.boardgamegeek_cleaner_fargate_trigger_role.name
  policy_arn = aws_iam_policy.boardgamegeek_cleaner_fargate_trigger_cloudwatch.arn
}

resource "aws_iam_role_policy_attachment" "boardgamegeek_cleaner_describe" {
  role       = aws_iam_role.boardgamegeek_cleaner_fargate_trigger_role.name
  policy_arn = aws_iam_policy.bgg-cleaner-describe-task-def.arn
}

resource "aws_iam_role_policy_attachment" "boardgamegeek_cleaner_s3" {
  role       = aws_iam_role.boardgamegeek_cleaner_fargate_trigger_role.name
  policy_arn = aws_iam_policy.S3_Access_boardgamegeek_scraper.arn
}

