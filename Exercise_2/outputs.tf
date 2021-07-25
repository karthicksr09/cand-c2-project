output "lambda_role_arn" {
  description = "The arn of the Lambda Function"
  value       = aws_iam_role.lambda_role.arn
}

output "lambda_function_arn" {
  description = "The arn of the Lambda Function"
  value       = aws_lambda_function.greet_lambda.arn
}

output "lambda_function_vpc_id" {
  description = "The arn of the Lambda Function"
  value       = aws_lambda_function.greet_lambda.vpc_config[0].vpc_id
}