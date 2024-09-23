
module "bgg_boardgame_file_retrieval" {
  source = "./modules/ecr"
  ecr_repository_name = "bgg_boardgame_file_retrieval"
}

output "bgg_boardgame_file_retrieval_repository_url" {
  value = module.bgg_boardgame_file_retrieval.repository_url
}

module "bgg_orchestrator" {
  source = "./modules/ecr"
  ecr_repository_name = "bgg_orchestrator"
  
}

module "boardgamegeek_cleaner" {
  source = "./modules/ecr"
  ecr_repository_name = "boardgamegeek_cleaner"
}

module "boardgamegeek_cleaner_dev" {
  source = "./modules/ecr"
  ecr_repository_name = "boardgamegeek_cleaner_dev"
}

module "boardgamegeek_scraper" {
  source = "./modules/ecr"
  ecr_repository_name = "boardgamegeek_scraper"
}

module "boardgamegeek_scraper_dev" {
  source = "./modules/ecr"
  ecr_repository_name = "boardgamegeek_scraper_dev"
}
