variable "grafana_auth_api_key" {
  default = "admin api key goes here" # should begin with ey... if unkonwn, create this at https://grafana.com/orgs/<your org slug>/api-keys
}

variable "cloud_org_slug" {
  default = "your cloud org slug goes here" # the name of the org you want to deploy the stack in!
}

variable "grafana_stack_name" {
  default = "terraform-stack"     #set this to whatever you want the stack to be called (nickname)
}

variable "grafana_stack_slug" {
  default = "terraformstack"    #this will be the stack slug. I suggest setting it similar to the nickname.
}