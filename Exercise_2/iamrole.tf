resource "aws_iam_role_policy_attachment" "iam_policy_lambda" {
  role       = aws_iam_role.lambda_role.id
  policy_arn = aws_iam_policy.lambda_policy.arn
}

resource "aws_iam_role" "lambda_role" {
  name               = "lambda_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "lambda_policy" {
  name   = "test-lambda_policy"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "Stmt1627133491400",
        "Action": "logs:*",
        "Effect": "Allow",
        "Resource": "*"
      },
      {
        "Effect": "Allow",
        "Action": [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents",
            "ec2:CreateNetworkInterface",
            "ec2:DescribeNetworkInterfaces",
            "ec2:DeleteNetworkInterface",
            "ec2:AssignPrivateIpAddresses",
            "ec2:UnassignPrivateIpAddresses"
        ],
        "Resource": "*"
        }
    ]
  }
EOF
}