# Terraform module ECS Scheduled Task

```
module "task" {
  source                     = "git@github.com:vicktornl/terraform-module-ecs-scheduled-task.git"
  name                       = "task"
  schedule_expression        = "cron(0 12 * * ? *)"
  cluster_arn                = "arn:aws:ecs:eu-west-1:123456789101:cluster/name"
  role_arn                   = "arn:aws:iam::123456789101:role/aws-service-role/ecs.amazonaws.com/AWSServiceRoleForECS"
  task_definition_arn        = "arn:aws:ecs:eu-west-2:123456789101:task-definition/task:1"
  container_override_name    = "uwsgi"
  container_override_command = "["manage.py", "my_task"]"
}
```

<!-- BEGIN_TF_DOCS -->
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
| [aws_cloudwatch_event_rule.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_arn"></a> [cluster\_arn](#input\_cluster\_arn) | n/a | `string` | n/a | yes |
| <a name="input_container_override_command"></a> [container\_override\_command](#input\_container\_override\_command) | n/a | `list(string)` | n/a | yes |
| <a name="input_container_override_name"></a> [container\_override\_name](#input\_container\_override\_name) | n/a | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | n/a | `string` | n/a | yes |
| <a name="input_schedule_expression"></a> [schedule\_expression](#input\_schedule\_expression) | n/a | `string` | n/a | yes |
| <a name="input_task_definition_arn"></a> [task\_definition\_arn](#input\_task\_definition\_arn) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
