data "spacelift_gitlab_integration" "this" {
  id = "legacygitlabtest" 
}

# Define the stack in Spacelift
resource "spacelift_stack" "testing" {
  name              = "gitlab-test2"
  repository        = "test"
  branch            = "main"
  terraform_version = "1.5.7"
  space_id = "devx-01HND497T9JKR76MR3KA2CDJHP"
  # GitHub Enterprise settings for the stack
  gitlab {
    namespace = "Daniellem97"
    id = data.spacelift_gitlab_integration.this.id
  }
}
