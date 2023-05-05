locals {
  internal_artifact_data = {
    api = {
      hostname = "${var.md_metadata.name_prefix}.${var.namespace}.svc.cluster.local"
      port = 4242
      protocol = "http"
    }
  }

  artifact_specs = {
    api = {
      version = "4.0.0"
    }
  }
}

resource "massdriver_artifact" "internal" {
  field                = "internal"
  provider_resource_id = "${var.md_metadata.name_prefix}-unleash-internal-api"
  name                 = "Kubernetes internal API endpoint for Unleash instance ${var.md_metadata.name_prefix}"
  artifact             = jsonencode({
    data = local.internal_artifact_data
    specs = local.artifact_specs
  })
}