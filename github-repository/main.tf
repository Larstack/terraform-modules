resource "github_repository" "main" {
  name               = var.name
  description        = var.description
  private            = var.private
  auto_init          = var.auto_init
  gitignore_template = var.gitignore_template
  topics             = var.topics
}

resource "github_branch_protection" "main" {
  count      = length((var.branches_to_protect))
  repository = github_repository.main.name
  branch     = var.branches_to_protect[count.index]

  required_pull_request_reviews {
    dismiss_stale_reviews      = true
    dismissal_users            = var.dismissal_users
    require_code_owner_reviews = true
  }
}

resource "github_repository_webhook" "main" {
  count      = length((var.webhooks))
  repository = github_repository.main.name
  events     = var.webhooks[count.index].webhook_events
  configuration {
    url          = var.webhooks[count.index].webhook_url
    content_type = var.webhooks[count.index].webhook_content_type
    secret       = var.webhooks[count.index].webhook_secret
    insecure_ssl = var.webhooks[count.index].webhook_insecure_ssl
  }
}
