terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "1.25.0"
    }
  }
}

provider "grafana" {
  cloud_api_key = var.grafana_auth_api_key
  sm_url        = "https://synthetic-monitoring-api-eu-west.grafana.net"
}

resource "grafana_cloud_stack" "my_stack" {
  name        = var.grafana_stack_name
  slug        = var.grafana_stack_slug
  region_slug = "eu"
}

resource "grafana_cloud_api_key" "viewer" {
  cloud_org_slug = var.cloud_org_slug
  name           = "terraform-sm-viewer-key"
  role           = "Viewer"
}

resource "grafana_cloud_api_key" "metricspublisher" {
  cloud_org_slug = var.cloud_org_slug
  name           = "terraform-sm-metricspublisher-key"
  role           = "MetricsPublisher"
}

resource "grafana_synthetic_monitoring_installation" "sm_stack" {
  stack_id              = grafana_cloud_stack.my_stack.id
  metrics_instance_id   = grafana_cloud_stack.my_stack.prometheus_user_id
  logs_instance_id      = grafana_cloud_stack.my_stack.logs_user_id
  metrics_publisher_key = grafana_cloud_api_key.metricspublisher.key
}

provider "grafana" {
  alias           = "sm"
  sm_access_token = grafana_synthetic_monitoring_installation.sm_stack.sm_access_token
  sm_url          = "https://synthetic-monitoring-api-eu-west.grafana.net"
}

data "grafana_synthetic_monitoring_probes" "main" {
  provider = grafana.sm
  depends_on = [
    grafana_synthetic_monitoring_installation.sm_stack
  ]
}
