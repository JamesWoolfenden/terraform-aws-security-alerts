# terraform-aws-security-alerts

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-security-alerts/workflows/Verify%20and%20Bump/badge.svg?branch=main)](https://github.com/JamesWoolfenden/terraform-aws-security-alerts)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-security-alerts.svg)](https://github.com/JamesWoolfenden/terraform-aws-security-alerts/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-aws-security-alerts.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-aws-security-alerts/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-aws-security-alerts/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-security-alerts&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-aws-security-alerts/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-security-alerts&benchmark=INFRASTRUCTURE+SECURITY)

This module is to help implement compliance with the CIS benchmarks as test in the Bridgecrew checkd:

- BC_AWS_MONITORING_1
- BC_AWS_MONITORING_2
- BC_AWS_MONITORING_6

---

This module is 100% Open Source and licensed under the [APACHE2](LICENSE).

## Introduction

This module deploys _security-alerts_ for an AWS account.

## Usage

Include this repository as a module in your existing Terraform code:

```hcl
module "security-alerts" {
  source            = "JamesWoolfenden/security-alerts/aws"
  version           = "v0.0.3"
  endpoint          = var.endpoint
}
```

## Costs

```text
Terraform directory at .
  ✔ Running terraform plan
  ✔ Running terraform show

✔ Calculating monthly cost estimate

Project: .

 Name                                                   Monthly Qty  Unit              Monthly Cost

 module.alerts.aws_cloudwatch_metric_alarm.nomfa
 └─ Standard resolution                                           1  alarm metrics            $0.10

 module.alerts.aws_cloudwatch_metric_alarm.signfail
 └─ Standard resolution                                           1  alarm metrics            $0.10

 module.alerts.aws_cloudwatch_metric_alarm.unauth
 └─ Standard resolution                                           1  alarm metrics            $0.10

 module.alerts.aws_sns_topic.trail-unauthorised
 └─ Requests                                         Cost depends on usage: $0.50 per 1M requests

 PROJECT TOTAL                                                                                $0.30

----------------------------------
To estimate usage-based resources use --usage-file, see https://infracost.io/usage-file

1 resource type wasn't estimated as it's not supported yet.
Please watch/star https://github.com/infracost/infracost as new resources are added regularly.
1 x aws_sns_topic_subscription
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_metric_filter.nomfa](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.signfail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_metric_filter.unauth](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_metric_alarm.nomfa](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.signfail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.unauth](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_sns_topic.trail-unauthorised](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_subscription.sms](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | n/a | `string` | n/a | yes |
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | n/a | `string` | `"alias/aws/sns"` | no |
| <a name="input_log_group_name"></a> [log\_group\_name](#input\_log\_group\_name) | n/a | `string` | `"cloudtrail"` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | n/a | `string` | `"sms"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alarms"></a> [alarms](#output\_alarms) | n/a |
| <a name="output_metrics"></a> [metrics](#output\_metrics) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Help

**Got a question?**

File a GitHub [issue](https://github.com/JamesWoolfenden/terraform-aws-security-alerts/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/JamesWoolfenden/terraform-aws-security-alerts/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2021 James Woolfenden

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
