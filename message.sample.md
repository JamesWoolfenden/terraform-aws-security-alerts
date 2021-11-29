This is what the lambda payload should look like:

{
   "Records": [
      {
         "EventSource": "aws:sns",
         "EventSubscriptionArn": "arn:aws:sns:eu-west-2:680235478471:Unauthorised:2a9b4036-2275-4619-bc50-07d8e01a21c5",
         "EventVersion": "1.0",
         "Sns": {
            "Message": "{\"AlarmName\":\"vpc_changes_alarm\",\"AlarmDescription\":null,\"AWSAccountId\":\"680235478471\",\"NewStateValue\":\"ALARM\",\"NewStateReason\":\"Testing the Amazon Cloudwatch alarm\",\"StateChangeTime\":\"2021-08-19T13:58:12.009+0000\",\"Region\":\"EU (London)\",\"AlarmArn\":\"arn:aws:cloudwatch:eu-west-2:680235478471:alarm:vpc_changes_alarm\",\"OldStateValue\":\"INSUFFICIENT_DATA\",\"Trigger\":{\"MetricName\":\"vpc_changes_metric\",\"Namespace\":\"CISBenchmark\",\"StatisticType\":\"Statistic\",\"Statistic\":\"SUM\",\"Unit\":null,\"Dimensions\":[],\"Period\":300,\"EvaluationPeriods\":1,\"ComparisonOperator\":\"GreaterThanOrEqualToThreshold\",\"Threshold\":1.0,\"TreatMissingData\":\"- TreatMissingData:                    missing\",\"EvaluateLowSampleCountPercentile\":\"\"}}",
            "MessageAttributes": {},
            "MessageId": "7f169f92-e4e0-50af-bc32-c60a8154c6ec",
            "Signature": "tbLQnxaCIyLbV8j1SvqBw/TEQfIiXVffmD4tEzxtklYYcqh03MT4M97997Dx6yiqfTRf+U35VQEo/hFcQQyuMJbgU/WEbo+zxoiDI6XA4CfQLYiS5jSl9lWpYDtCENgBRdrSRdoqantC0zXtekzQXyf7bhIdeZw5LmqCKZNEnX90W74KYy06b3BsOoVxR0/bTy+Qbg/KO/Cxyk3/xKatZKAarphd99hwvJFF+iYoYeWgAL/UkuHTh/lTbqa8oz+upCJxGou//eWcWIqeHwbU0e38IFsAOautchCC/QpB/+JNsmDoD6FvNeHwc4WnVKfaBFiRLC+cDOl8L+Gfk1wtUA==",
            "SignatureVersion": "1",
            "SigningCertUrl": "https://urldefense.proofpoint.com/v2/url?u=https-3A__sns.eu-2Dwest-2D2.amazonaws.com_SimpleNotificationService-2D010a507c1833636cd94bdb98bd93083a.pem&d=DwICaQ&c=V9IgWpI5PvzTw83UyHGVSoW3Uc1MFWe5J8PTfkrzVSo&r=4swPLFBnc0bEa0eCYAXVTwbfSHo3u8zED6QU--oM1Jw&m=XS6I94MhjeRV_W_NQUxWcRMMrd5tgW1827p60Vpx3Ks&s=w5N5C3fPdh520NSjaVMSaP0XEeouqjA0CrPUGgt7Q1I&e= ",
            "Subject": "ALARM: \"vpc_changes_alarm\" in EU (London)",
            "Timestamp": "2021-08-19T13:58:12.050Z",
            "TopicArn": "arn:aws:sns:eu-west-2:680235478471:Unauthorised",
            "Type": "Notification",
            "UnsubscribeUrl": "https://urldefense.proofpoint.com/v2/url?u=https-3A__sns.eu-2Dwest-2D2.amazonaws.com_-3FAction-3DUnsubscribe-26SubscriptionArn-3Darn-3Aaws-3Asns-3Aeu-2Dwest-2D2-3A680235478471-3AUnauthorised-3A2a9b4036-2D2275-2D4619-2Dbc50-2D07d8e01a21c5&d=DwICaQ&c=V9IgWpI5PvzTw83UyHGVSoW3Uc1MFWe5J8PTfkrzVSo&r=4swPLFBnc0bEa0eCYAXVTwbfSHo3u8zED6QU--oM1Jw&m=XS6I94MhjeRV_W_NQUxWcRMMrd5tgW1827p60Vpx3Ks&s=QL2Ja12_9UUysD0gHVQ8t600h0cxp3nLrrcQLSJ6e6w&e= "
         }
      }
   ]
}
