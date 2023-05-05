locals {
  helm_values = {
    labels   = var.md_metadata.default_tags
    dbConfig = {
      host     = var.postgresql_authentication.data.authentication.hostname
      user     = var.postgresql_authentication.data.authentication.username
      pass     = var.postgresql_authentication.data.authentication.password
      port     = var.postgresql_authentication.data.authentication.port
      database = var.database.name
    }
    resources = {
      requests = var.resources.requests
      limits = var.resources.enable_limits ? var.resources.requests : null
    }
    autoscaling = var.autoscaling
    replicaCount = var.autoscaling.enabled ? 1 : var.autoscaling.replicaCount
    ingress = {
      enabled = var.ingress.enabled
      className = "nginx" // TODO: eventually this should come from the kubernetes artifact
      annotations = {
        "cert-manager.io/cluster-issuer" : "letsencrypt-prod"     // TODO: eventually this should come from kubernetes artifact
        "nginx.ingress.kubernetes.io/force-ssl-redirect" = "true" // TODO: hardcoding this for now, dependent on nginx
      }
      hosts: [{
        host: try(var.ingress.host, "")
        paths: [{
          path: try(var.ingress.path, "")
          pathType: "ImplementationSpecific"
        }]
      }]
      tls = [{
        hosts: [try(var.ingress.host, "")]
        secretName: "${var.md_metadata.name_prefix}-tls"
      }]
    }
  }
}
