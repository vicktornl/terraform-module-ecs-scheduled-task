locals {
  task_definition_arn_only = replace(var.task_definition_arn, "/:\\d+$/", "")
}

resource "aws_cloudwatch_event_rule" "main" {
  name = var.name

  # https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html
  schedule_expression = var.schedule_expression
}


resource "aws_cloudwatch_event_target" "main" {
  target_id = var.name
  rule      = aws_cloudwatch_event_rule.main.name
  arn       = var.cluster_arn
  role_arn  = var.role_arn

  input = jsonencode({
    containerOverrides = [{
      name    = var.container_override_name,
      command = var.container_override_command
    }]
  })

  ecs_target {
    task_count          = 1
    task_definition_arn = local.task_definition_arn_only
  }

  /*
  dynamic "dead_letter_config" {
    for_each = var.dead_letter_arn != "" ? [var.dead_letter_arn] : []

    content {
      arn = var.dead_letter_arn.value
    }
  }
  */
}