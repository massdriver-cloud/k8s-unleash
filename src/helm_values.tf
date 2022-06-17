locals {
  cpu_request              = 0.5
  memory_request_mib       = 256
  request_limit_multiplier = 1.25

  helm_values = {
    labels   = var.md_metadata.default_tags
    username = "admin"
    password = random_password.unleash_secret.result
    dbConfig = {
      host     = var.postgresql_authentication.data.authentication.hostname
      user     = var.postgresql_authentication.data.authentication.username
      pass     = var.postgresql_authentication.data.authentication.password
      port     = var.postgresql_authentication.data.authentication.port
      database = "postgres"
      ssl      = true
    }
    resources = {
      requests = {
        cpu    = local.cpu_request
        memory = "${local.memory_request_mib}Mi"
      }
      limits = {
        cpu    = local.cpu_request * local.request_limit_multiplier
        memory = "${local.memory_request_mib * local.request_limit_multiplier}Mi"
      }
    }
    autoscaling = {
      enabled                        = true
      minReplicas                    = 2
      maxReplicas                    = 10
      targetCPUUtilizationPercentage = 80
    }
  }
}
