resource "aws_iam_role" "SNSSuccessFeedback" {
  name_prefix        = "SNSSuccessFeedback"
  assume_role_policy = <<HERE
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "sns.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
HERE
}


resource "aws_iam_role_policy" "success" {
  name = "success"
  role = aws_iam_role.SNSSuccessFeedback.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents",
                "logs:PutMetricFilter",
                "logs:PutRetentionPolicy"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
POLICY
}
