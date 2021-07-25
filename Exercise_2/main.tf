locals {
  lambdaziplocation = "outputs/greet_lambda.zip"
}

data "archive_file" "init" {
  type        = "zip"
  source_file = "greet_lambda.py"
  output_path = local.lambdaziplocation
}

resource "aws_lambda_function" "greet_lambda" {
  filename      = local.lambdaziplocation
  function_name = "greet_lambda"
  role          = aws_iam_role.lambda_role.arn
  handler       = "greet_lambda.lambda_handler"
  vpc_config {
    subnet_ids         = [var.pubSubnet]
    security_group_ids = [var.secGrpId]
  }
  runtime = "python3.7"
  environment {
    variables = {
      greeting = "Greetings!!! Welcome to Lambda..."
    }
  }
}