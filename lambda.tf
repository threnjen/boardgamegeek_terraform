module "bgg_generate_game_urls" {
  source         = "./modules/lambda_function_direct"
  function_name = "bgg_generate_game_urls"
  timeout       = 900
  memory_size   = 512
  role          = aws_iam_role.bgg_generate_game_urls_lambda_role.arn
  handler       = "generate_game_urls_lambda.lambda_handler"
  layers = ["arn:aws:lambda:us-west-2:336392948345:layer:AWSSDKPandas-Python312:9"]
  environment="prod"
}

module "boardgame_scraper_fargate_trigger" {
  source         = "./modules/lambda_function_direct"
  function_name = "boardgame_scraper_fargate_trigger"
  timeout       = 600
  memory_size   = 128
  role          = aws_iam_role.boardgamegeek_scraper_fargate_trigger_role.arn
  handler       = "boardgame_scraper_fargate_trigger.lambda_handler"
  environment="prod"
}


module "boardgame_scraper_fargate_trigger_dev" {
  source         = "./modules/lambda_function_direct"
  function_name = "boardgame_scraper_fargate_trigger_dev"
  timeout       = 600
  memory_size   = 128
  role          = aws_iam_role.boardgamegeek_scraper_fargate_trigger_role.arn
  handler       = "boardgame_scraper_fargate_trigger.lambda_handler"
  environment="dev"
}

module "boardgamegeek_cleaner_fargate_trigger" {
  source         = "./modules/lambda_function_direct"
  function_name = "boardgamegeek_cleaner_fargate_trigger"
  timeout       = 600
  memory_size   = 128
  role          = aws_iam_role.boardgamegeek_cleaner_fargate_trigger_role.arn
  handler       = "boardgame_cleaner_fargate_trigger.lambda_handler"
  environment="prod"
}


module "boardgamegeek_cleaner_fargate_trigger_dev" {
  source         = "./modules/lambda_function_direct"
  function_name = "boardgamegeek_cleaner_fargate_trigger_dev"
  timeout       = 600
  memory_size   = 128
  role          = aws_iam_role.boardgamegeek_cleaner_fargate_trigger_role.arn
  handler       = "boardgame_cleaner_fargate_trigger.lambda_handler"
  environment="dev"
}

resource "aws_lambda_function" "bgg_boardgame_file_retrieval" {
  depends_on = [ module.bgg_boardgame_file_retrieval ]
  function_name = "bgg_boardgame_file_retrieval"
  timeout       = 900
  memory_size   = 512
  image_uri     = "${module.bgg_boardgame_file_retrieval.repository_url}:latest"
  package_type  = "Image"

  role = aws_iam_role.bgg_boardgame_file_retrieval_role.arn

  environment {
    variables = merge(
      { for tuple in regexall("(.*?)=(.*)", file(".env")) : tuple[0] => tuple[1] },
      {
        ENV = "prod"
    })
  }
}

