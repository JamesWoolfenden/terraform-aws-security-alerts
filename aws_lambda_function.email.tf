resource "aws_lambda_function" "email" {
  # checkov:skip=CKV_AWS_289: X-Ray tracing not required for this Lambda
  # checkov:skip=CKV_AWS_288: Reserved concurrency not configured for this Lambda
  # checkov:skip=CKV_AWS_284: Log group retention managed separately
  # checkov:skip=CKV_AWS_286: Log group encryption managed separately
  # checkov:skip=CKV_AWS_117: only using managed services
  # checkov:skip=CKV_AWS_116: DLQ not needed for now
  # checkov:skip=CKV_AWS_272: code-signing config out of scope for this module

  function_name                  = var.function_name
  role                           = aws_iam_role.lambda-messageprocessor.arn
  runtime                        = "python3.12"
  handler                        = "handler.lambda_handler"
  filename                       = data.archive_file.notify.output_path
  source_code_hash               = data.archive_file.notify.output_base64sha256
  reserved_concurrent_executions = var.concurrency
  tracing_config {
    mode = "PassThrough"
  }
}


variable "function_name" {
  type    = string
  default = "message-processor"
}


data "archive_file" "notify" {
  type = "zip"
  source {
    content  = templatefile("${path.module}/lambda/handler.py.tmpl", { snstopic = aws_sns_topic.processed-message.arn })
    filename = "handler.py"
  }

  output_path = "${path.module}/lambda/lambda.zip"
}

resource "aws_lambda_permission" "with_sns" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.email.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.trail-unauthorised.arn
}
