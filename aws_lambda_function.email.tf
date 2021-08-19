resource "aws_lambda_function" "email" {
  # checkov:skip=CKV_AWS_117: only using managed services
  # checkov:skip=CKV_AWS_116: DLQ not needed for now

  function_name                  = var.function_name
  role                           = aws_iam_role.lambda-messageprocessor.arn
  runtime                        = "python3.6"
  handler                        = "handler.lambda_handler"
  filename                       = "${path.module}/lambda/lambda.zip"
  source_code_hash               = filebase64sha256("${path.module}/lambda/lambda.zip")
  reserved_concurrent_executions = var.concurrency

  depends_on = [data.archive_file.notify]
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
