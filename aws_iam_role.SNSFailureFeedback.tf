
resource "aws_iam_role" "SNSFailureFeedback" {
  name_prefix        = "SNSFailureFeedback"
  assume_role_policy = <<ASSUME
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

ASSUME
}


resource "aws_iam_role_policy" "failure" {
  name = "failure"
  role = aws_iam_role.SNSFailureFeedback.id

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
