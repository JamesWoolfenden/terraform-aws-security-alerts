# terraform-aws-security-alerts

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-security-alerts/workflows/Verify%20and%20Bump/badge.svg?branch=main)](https://github.com/JamesWoolfenden/terraform-aws-security-alerts)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-security-alerts.svg)](https://github.com/JamesWoolfenden/terraform-aws-security-alerts/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-aws-security-alerts.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-aws-security-alerts/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-aws-security-alerts/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-security-alerts&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-aws-security-alerts/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-security-alerts&benchmark=INFRASTRUCTURE+SECURITY)

This module is to help implement compliance with the CIS benchmarks as tested in the Bridgecrew checks <https://docs.bridgecrew.io/docs/monitoring-policies>:

- BC_AWS_MONITORING_1
- BC_AWS_MONITORING_2
- BC_AWS_MONITORING_3
- BC_AWS_MONITORING_4
- BC_AWS_MONITORING_5
- BC_AWS_MONITORING_6
- BC_AWS_MONITORING_7
- BC_AWS_MONITORING_8
- BC_AWS_MONITORING_9
- BC_AWS_MONITORING_10
- BC_AWS_MONITORING_11
- BC_AWS_MONITORING_12
- BC_AWS_MONITORING_13
- BC_AWS_MONITORING_14

---

This module is 100% Open Source and licensed under the [APACHE2](LICENSE).

## Introduction

This module deploys _security-alerts_ for an AWS account.
TODO: Update to use lambda rather than SNS Email - https://aws.amazon.com/premiumsupport/knowledge-center/change-sns-email-for-cloudwatch-events/

## Usage

Include this repository as a module in your existing Terraform code:

```hcl
module "security-alerts" {
  source            = "JamesWoolfenden/security-alerts/aws"
  version           = "v0.0.3"
  endpoint          = var.endpoint
}
```

## Testing

```bash
aws cloudwatch set-alarm-state --alarm-name "vpc_changes_alarm" --state-reason "Testing the Amazon Cloudwatch alarm" --state-value ALARM --region eu-west-2
```

## Costs

```text
Calculated monthly cost estimate

Project: .

 Name                                                      Monthly Qty  Unit           Monthly Cost

 module.alerts.aws_cloudwatch_metric_alarm.bucket_mod
 └─ Standard resolution                                              1  alarm metrics         $0.10

 module.alerts.aws_cloudwatch_metric_alarm.cloudtrail_cfg
 └─ Standard resolution                                              1  alarm metrics         $0.10

 module.alerts.aws_cloudwatch_metric_alarm.cmk
 └─ Standard resolution                                              1  alarm metrics         $0.10

 module.alerts.aws_cloudwatch_metric_alarm.config_change
 └─ Standard resolution                                              1  alarm metrics         $0.10

 module.alerts.aws_cloudwatch_metric_alarm.gateway
 └─ Standard resolution                                              1  alarm metrics         $0.10

 module.alerts.aws_cloudwatch_metric_alarm.nacl
 └─ Standard resolution                                              1  alarm metrics         $0.10

 module.alerts.aws_cloudwatch_metric_alarm.nomfa
 └─ Standard resolution                                              1  alarm metrics         $0.10

 module.alerts.aws_cloudwatch_metric_alarm.policychange
 └─ Standard resolution                                              1  alarm metrics         $0.10

 module.alerts.aws_cloudwatch_metric_alarm.root
 └─ Standard resolution                                              1  alarm metrics         $0.10

 module.alerts.aws_cloudwatch_metric_alarm.routes
 └─ Standard resolution                                              1  alarm metrics         $0.10

 module.alerts.aws_cloudwatch_metric_alarm.sg
 └─ Standard resolution                                              1  alarm metrics         $0.10

 module.alerts.aws_cloudwatch_metric_alarm.signfail
 └─ Standard resolution                                              1  alarm metrics         $0.10

 module.alerts.aws_cloudwatch_metric_alarm.unauth
 └─ Standard resolution                                              1  alarm metrics         $0.10

 module.alerts.aws_cloudwatch_metric_alarm.vpc
 └─ Standard resolution                                              1  alarm metrics         $0.10

 module.alerts.aws_sns_topic.trail-unauthorised
 └─ Requests                                                         0  1M requests           $0.00

 PROJECT TOTAL                                                                                $1.40

----------------------------------
1 resource type wasn't estimated as it's not supported yet.
1 x aws_sns_topic_subscription
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | n/a |
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.processor](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_metric_filter.bucket_mod](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.cloudtrail_cfg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.cmk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.config_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.nacl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.nomfa](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.policychange](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.root](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.routes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.signfail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.unauth](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_metric_alarm.bucket_mod](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.cloudtrail_cfg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.cmk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.config_change](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.nacl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.nomfa](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.policychange](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.root](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.routes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.signfail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.unauth](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_iam_role.SNSFailureFeedback](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.SNSSuccessFeedback](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.lambda-messageprocessor](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.failure](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.success](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_kms_alias.alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_lambda_function.email](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_permission.with_sns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_sns_topic.processed-message](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic.trail-unauthorised](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.Emailfromlambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [aws_sns_topic_subscription.lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |
| [archive_file.notify](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_concurrency"></a> [concurrency](#input\_concurrency) | n/a | `number` | `1` | no |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | n/a | `string` | n/a | yes |
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | n/a | `string` | `"message-processor"` | no |
| <a name="input_kms-alias"></a> [kms-alias](#input\_kms-alias) | n/a | `string` | `"alias/alarms"` | no |
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | n/a | `string` | `"alias/aws/sns"` | no |
| <a name="input_log_group_name"></a> [log\_group\_name](#input\_log\_group\_name) | n/a | `string` | `"cloudtrail"` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | n/a | `string` | `"sms"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alarms"></a> [alarms](#output\_alarms) | The alarms created |
| <a name="output_lambda"></a> [lambda](#output\_lambda) | The lambda |
| <a name="output_metrics"></a> [metrics](#output\_metrics) | The metrics filters for the Alarms |
| <a name="output_sns_topic_processed"></a> [sns\_topic\_processed](#output\_sns\_topic\_processed) | The final SNS endpoint for a processed message |
| <a name="output_sns_topic_subscription_lambda"></a> [sns\_topic\_subscription\_lambda](#output\_sns\_topic\_subscription\_lambda) | The SNS subcription that pulls messages into being processed by the Lambda |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Help

**Got a question?**

File a GitHub [issue](https://github.com/JamesWoolfenden/terraform-aws-security-alerts/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/JamesWoolfenden/terraform-aws-security-alerts/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2021-2022 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-security-alerts&url=https://github.com/JamesWoolfenden/terraform-security-alerts
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-security-alerts&url=https://github.com/JamesWoolfenden/terraform-security-alerts
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-aws-security-alerts
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-aws-security-alerts
[share_email]: mailto:?subject=terraform-aws-security-alerts&body=https://github.com/JamesWoolfenden/terraform-aws-security-alerts
