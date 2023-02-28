# deploy-grafana-with-synth-monitoring-via-terraform
Deploy a Grafana Cloud stack with synthetic monitoring enabled using the Terraform provider

Tested with terraform version 1.3.9.

# Docs:

check out the docs for the terraform provider at:

https://grafana.com/docs/grafana-cloud/infrastructure-as-code/terraform/terraform-cloud-stack/

and

https://registry.terraform.io/providers/grafana/grafana/latest/docs

e.g , to understand how to deploy a stack, you want to check out the definition of the stack resource at :

https://registry.terraform.io/providers/grafana/grafana/latest/docs/resources/cloud_stack

This repo is an example of a stack deployed with synthetic monitoring enabled.

# How to use

1] pull this repo.
2] execute a 'terraform init' command {docs; https://developer.hashicorp.com/terraform/cli/commands/init }
3] populate the variables.tf file with the values you need to provide for your api key, stack name, etc. make sure you use an api key with admin rights.
4] do a 'terraform plan', this'l tell you the changes it plans to make and validate your settings.
5] do a 'terraform apply' if satisfied with the changes.

# What does this terraform file actually make?

it makes:

-a stack

-an api key with viewer permissions in the selected org (defined by cloud_org_slug).

-an api key with metricsPublisher permissions, used when configuring the synthetic monitoring, in the selected org(defined by cloud_org_slug)
