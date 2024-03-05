data "spacelift_gitlab_integration" "this" {
  id = "legacygitlabtest" 
}

# Define the stack in Spacelift
resource "spacelift_stack" "testing" {
  name              = "gitlab-test"
  repository        = "test"
  branch            = "main"
  terraform_version = "1.5.7"
  space_id = "metabasetest-01HBRT2GZTJEVVA4APJDNTNSV1"
  # GitHub Enterprise settings for the stack
  gitlab {
    namespace = "Daniellem97"
    id = data.spacelift_gitlab_integration.this.id
  }
}
