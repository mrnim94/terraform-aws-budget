
resource "aws_budgets_budget" "main" {
  for_each = { for i, budget in var.budgets : budget.name => budget }

  name = format("%s-%s", var.name, each.value.name)

  budget_type  = each.value.budget_type
  limit_amount = each.value.limit_amount
  limit_unit   = each.value.limit_unit
  time_unit    = each.value.time_unit

  account_id        = data.aws_caller_identity.current.account_id
  time_period_start = each.value.time_period_start
  time_period_end   = each.value.time_period_end

  dynamic "cost_filter" {
    for_each = each.value.cost_filter == null ? {} : each.value.cost_filter
    content {
      name   = cost_filter.key
      values = cost_filter.value
    }
  }

  notification {
    comparison_operator        = each.value.notification.comparison_operator
    notification_type          = each.value.notification.notification_type
    subscriber_email_addresses = var.recipients
    threshold                  = each.value.notification.threshold
    threshold_type             = each.value.notification.threshold_type
  }
}
