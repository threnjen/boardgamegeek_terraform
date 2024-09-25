module "bgg_boardgame_file_retrieval_role" {
  source    = "./modules/iam_lambda_roles"
  role_name = "bgg_boardgame_file_retrieval_role"
}

resource "aws_iam_role_policy_attachment" "bgg_boardgame_file_retrieval" {
  role       = module.bgg_boardgame_file_retrieval_role.role_name
  policy_arn = aws_iam_policy.S3_Access_boardgamegeek_scraper.arn
}

module "bgg_generate_game_urls_lambda_role" {
  source    = "./modules/iam_lambda_roles"
  role_name = "bgg_generate_game_urls_lambda_role"
}
resource "aws_iam_role_policy_attachment" "bgg_generate_game_urls_lambda_role" {
  role       = module.bgg_generate_game_urls_lambda_role.role_name
  policy_arn = aws_iam_policy.S3_Access_boardgamegeek_scraper.arn
}

module "bgg_generate_user_urls_lambda" {
  source    = "./modules/iam_lambda_roles"
  role_name = "bgg_generate_user_urls_lambda"

}

resource "aws_iam_role_policy_attachment" "bgg_generate_user_urls_lambda" {
  role       = module.bgg_generate_user_urls_lambda.role_name
  policy_arn = aws_iam_policy.S3_Access_boardgamegeek_scraper.arn
}

module "boardgamegeek_scraper_fargate_trigger_role" {
  source    = "./modules/iam_lambda_roles"
  role_name = "boardgamegeek_scraper_fargate_trigger_role"

}

resource "aws_iam_role_policy_attachment" "boardgamegeek_scraper_describe" {
  role       = module.boardgamegeek_scraper_fargate_trigger_role.role_name
  policy_arn = aws_iam_policy.bgg-scraper-describe-task-def.arn
}

resource "aws_iam_role_policy_attachment" "boardgamegeek_scraper_cloudwatch" {
  role       = module.boardgamegeek_scraper_fargate_trigger_role.role_name
  policy_arn = aws_iam_policy.boardgame_scraper_fargate_trigger_cloudwatch.arn
}

resource "aws_iam_role_policy_attachment" "boardgamegeek_scraper_S3" {
  role       = module.boardgamegeek_scraper_fargate_trigger_role.role_name
  policy_arn = aws_iam_policy.S3_Access_boardgamegeek_scraper.arn
}

module "boardgamegeek_cleaner_fargate_trigger_role" {
  source    = "./modules/iam_lambda_roles"
  role_name = "boardgamegeek_cleaner_fargate_trigger_role"
}

resource "aws_iam_role_policy_attachment" "boardgamegeek_cleaner_cloudwatch" {
  role       = module.boardgamegeek_cleaner_fargate_trigger_role.role_name
  policy_arn = aws_iam_policy.boardgamegeek_cleaner_fargate_trigger_cloudwatch.arn
}

resource "aws_iam_role_policy_attachment" "boardgamegeek_cleaner_describe" {
  role       = module.boardgamegeek_cleaner_fargate_trigger_role.role_name
  policy_arn = aws_iam_policy.bgg-cleaner-describe-task-def.arn
}

resource "aws_iam_role_policy_attachment" "boardgamegeek_cleaner_s3" {
  role       = module.boardgamegeek_cleaner_fargate_trigger_role.role_name
  policy_arn = aws_iam_policy.S3_Access_boardgamegeek_scraper.arn
}


