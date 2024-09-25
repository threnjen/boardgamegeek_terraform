
resource "aws_iam_role" "GitHubActions_Push_Role" {
  name = "GitHubActions_Push_Role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          "Federated" : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/token.actions.githubusercontent.com"
        },
        Action = "sts:AssumeRoleWithWebIdentity",
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" : "sts.amazonaws.com"
          },
          StringLike = {
            "token.actions.githubusercontent.com:sub" : "repo:threnjen/*"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "boardgamegeekscraper_github_cicd_ecrGitHubActions_Push_Role" {
  role       = aws_iam_role.GitHubActions_Push_Role.name
  policy_arn = aws_iam_policy.boardgamegeekscraper_github_cicd_ecr.arn
}

resource "aws_iam_role_policy_attachment" "boardgamegeekscraper_github_cicd_lambda_functionsGitHubActions_Push_Role" {
  role       = aws_iam_role.GitHubActions_Push_Role.name
  policy_arn = aws_iam_policy.boardgamegeekscraper_github_cicd_lambda_functions.arn
}

resource "aws_iam_policy" "boardgamegeekscraper_github_cicd_lambda_functions" {
  name = "boardgamegeekscraper_github_cicd_lambda_functions"
  path = "/"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "Statement1",
        Effect = "Allow",
        Action = [
          "iam:ListRoles"
        ],
        Resource = "*"
      },
      {
        Effect = "Allow",
        Action = [
          "lambda:UpdateFunctionCode",
          "lambda:GetFunctionConfiguration",
          "lambda:UpdateFunctionConfiguration",
          "lambda:GetFunction"
        ],
        Resource = [
          for repo in local.lambda_functions : format("arn:aws:ecr:${var.REGION}:${data.aws_caller_identity.current.account_id}:repository/%s", repo)
        ]
      }
    ]
  })
}

resource "aws_iam_policy" "boardgamegeekscraper_github_cicd_ecr" {
  name = "boardgamegeekscraper_github_cicd_ecr"
  path = "/"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid      = "VisualEditor0",
        Effect   = "Allow",
        Action   = "ecr:GetAuthorizationToken",
        Resource = "*"
      },
      {
        Sid    = "VisualEditor1",
        Effect = "Allow",
        Action = [
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:CompleteLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:InitiateLayerUpload",
          "ecr:BatchCheckLayerAvailability",
          "ecr:PutImage"
        ],
        Resource = [
          for repo in local.ecr_repositories : format("arn:aws:ecr:${var.REGION}:${data.aws_caller_identity.current.account_id}:repository/%s", repo)
        ]
      }
    ]
  })
}