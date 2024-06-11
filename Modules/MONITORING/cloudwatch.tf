
# create an SNS topic for astrovidhi-prod API servers

resource "aws_sns_topic" "prod_servers_sns_topic" {
  name = var.sns_prod-API-server-name
}

resource "aws_sns_topic_policy" "prod_sns_topic_policy" {
  arn = aws_sns_topic.prod_servers_sns_topic.arn
  policy = data.aws_iam_policy_document.prod_sns_policy_document.json
}

data "aws_iam_policy_document" "prod_sns_policy_document" {
  policy_id = "__default_policy_ID"

  statement {
    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"

      values = [
        var.account_id,
      ]
    }

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
      aws_sns_topic.prod_servers_sns_topic.arn,
    ]

    sid = "__default_statement_ID"
  }
}

# create an SNS topicsubscription for astrovidhi-prod

resource "aws_sns_topic_subscription" "IT-Admin" {
  topic_arn = aws_sns_topic.prod_servers_sns_topic.arn
  protocol  = "email"
  endpoint  = "sabeermohamed.in@gmail.com"
}

resource "aws_sns_topic_subscription" "CEO" {
  topic_arn = aws_sns_topic.prod_servers_sns_topic.arn
  protocol  = "email"
  endpoint  = "astrovidhi007@gmail.com"
}

resource "aws_sns_topic_subscription" "DEV" {
  topic_arn = aws_sns_topic.prod_servers_sns_topic.arn
  protocol  = "email"
  endpoint  = "karthiappsmine@gmail.com"
}

resource "aws_sns_topic_subscription" "CEO-M" {
  topic_arn = aws_sns_topic.prod_servers_sns_topic.arn
  protocol  = "sms"
  endpoint  = "+919169161555"
}

resource "aws_sns_topic_subscription" "DEV-M" {
  topic_arn = aws_sns_topic.prod_servers_sns_topic.arn
  protocol  = "sms"
  endpoint  = "+919659599191"
}

resource "aws_sns_topic_subscription" "IT-M" {
  topic_arn = aws_sns_topic.prod_servers_sns_topic.arn
  protocol  = "sms"
  endpoint  = "+919994877255"
}

resource "aws_cloudwatch_metric_alarm" "prod_api-1_cpu" {
  alarm_name          = "prod-api-1-cpu-utilization"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "This metric monitors prod_api-1 cpu utilization"
  alarm_actions       = [aws_sns_topic.prod_servers_sns_topic.arn]
  dimensions = {
    InstanceId = "i-097f708f2d6610c8e"
  }
}

resource "aws_cloudwatch_metric_alarm" "prod_api-2_cpu" {
  alarm_name          = "prod-api-2-cpu-utilization"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "This metric monitors prod_api-2 cpu utilization"
  alarm_actions       = [aws_sns_topic.prod_servers_sns_topic.arn]
  dimensions = {
    InstanceId = "i-0702aaab850b9b335"
  }
}

