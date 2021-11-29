
resource "aws_iam_role" "lambda-messageprocessor" {
  name_prefix        = "lambda-messageprocessor"
  assume_role_policy = <<ASSUME
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}

ASSUME
}


resource "aws_iam_role_policy" "lambda" {
  role   = aws_iam_role.lambda-messageprocessor.name
  name   = "lambda"
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogStream",
                "sns:Publish",
                "logs:CreateLogGroup",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "${aws_cloudwatch_log_group.processor.arn}",
                "${aws_cloudwatch_log_group.processor.arn}:*",
                "${aws_sns_topic.processed-message.arn}"
            ]
        }
    ]
}
POLICY
}
