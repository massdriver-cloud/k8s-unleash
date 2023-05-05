locals {
  chart_version = "2.8.0"
  release       = var.md_metadata.name_prefix
}

resource "helm_release" "unleash" {
  name             = local.release
  chart            = "unleash"
  repository       = "https://docs.getunleash.io/helm-charts"
  version          = local.chart_version
  namespace        = var.namespace
  create_namespace = true

  values = [
    "${file("${path.module}/values.yaml")}",
    yamlencode(local.helm_values)
  ]
}
