variable "name" {
  description = "The repository name"
  type        = string
}

variable "description" {
  description = "The repository description"
  type        = string
}

variable "private" {
  description = "Set whether the repository is private"
  default     = true
}

variable "auto_init" {
  description = "Set whether an initial commit should be made to the repository"
  default     = true
}

variable "gitignore_template" {
  description = "Select GitHub gitignore template (https://github.com/github/gitignore)"
  default     = ""
}

variable "topics" {
  description = "The repository topics"
  type        = list(string)
  default     = []
}

variable "branches_to_protect" {
  description = "The branches names to protect. To protect branch master, auto_init must be set"
  type        = list(string)
  default     = []
}

variable "dismissal_users" {
  description = "The users which is granted the access to dismiss review on the protected branch"
  type        = list(string)
  default     = []
}

variable "webhooks" {
  description = "Configuration to manage webhooks"
  type = list(object({
    webhook_url          = string
    webhook_content_type = string
    webhook_insecure_ssl = string
    webhook_secret       = string
    webhook_events       = list(string)
  }))
  default     = []
}
