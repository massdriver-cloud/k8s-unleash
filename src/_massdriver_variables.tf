// Auto-generated variable declarations from massdriver.yaml
variable "autoscaling" {
  type = object({
    enabled                        = bool
    maxReplicas                    = optional(number)
    minReplicas                    = optional(number)
    targetCPUUtilizationPercentage = optional(number)
    replicaCount                   = optional(number)
  })
}
variable "database" {
  type = object({
    name = string
  })
}
variable "ingress" {
  type = object({
    enabled = bool
    host    = optional(string)
    path    = optional(string)
  })
}
variable "kubernetes_cluster" {
  type = object({
    data = object({
      authentication = object({
        cluster = object({
          certificate-authority-data = string
          server                     = string
        })
        user = object({
          token = string
        })
      })
      infrastructure = optional(object({
        arn             = optional(string)
        oidc_issuer_url = optional(string)
        ari             = optional(string)
        grn             = optional(string)
      }))
    })
    specs = optional(object({
      aws = optional(object({
        region = optional(string)
      }))
      azure = optional(object({
        region = string
      }))
      gcp = optional(object({
        project = optional(string)
        region  = optional(string)
      }))
      kubernetes = object({
        cloud            = string
        distribution     = string
        platform_version = optional(string)
        version          = string
      })
    }))
  })
}
variable "md_metadata" {
  type = object({
    default_tags = object({
      managed-by  = string
      md-manifest = string
      md-package  = string
      md-project  = string
      md-target   = string
    })
    deployment = object({
      id = string
    })
    name_prefix = string
    observability = object({
      alarm_webhook_url = string
    })
    package = object({
      created_at             = string
      deployment_enqueued_at = string
      previous_status        = string
      updated_at             = string
    })
    target = object({
      contact_email = string
    })
  })
}
variable "namespace" {
  type = string
}
variable "postgresql_authentication" {
  type = object({
    data = object({
      authentication = object({
        hostname = string
        password = string
        port     = number
        username = string
      })
      infrastructure = object({
        arn                  = optional(string)
        name                 = optional(string)
        ari                  = optional(string)
        kubernetes_namespace = optional(string)
        kubernetes_service   = optional(string)
      })
      security = object({
        iam = optional(map(object({
          policy_arn = string
        })))
        identity = optional(object({
          role_arn = optional(string)
        }))
        network = optional(map(object({
          arn      = string
          port     = number
          protocol = string
        })))
      })
    })
    specs = object({
      aws = optional(object({
        region = optional(string)
      }))
      azure = optional(object({
        region = string
      }))
      gcp = optional(object({
        project = optional(string)
        region  = optional(string)
      }))
      rdbms = object({
        engine         = string
        engine_version = optional(string)
        version        = string
      })
    })
  })
}
variable "resources" {
  type = object({
    enable_limits = bool
    requests = object({
      cpu    = number
      memory = number
    })
  })
}
