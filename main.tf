data "spacelift_github_enterprise_integration" "this" {
  id = "legacy-test" # Optional: Specify the integration ID if not using the default
}

# Define the stack in Spacelift
resource "spacelift_stack" "metabase_test" {
  name              = "metabase-test"
  repository        = "tftest"
  branch            = "main"
  project_root      = "path/to/metabase"
  terraform_version = "1.5.7"
  space_id = "metabasetest2-01HR4MYZWE0APZGRDR21CCDB45"
  # GitHub Enterprise settings for the stack
  github_enterprise {
    namespace = "Daniellem97" # The GitHub organization or user the repository belongs to
    id = data.spacelift_github_enterprise_integration.this.id
  }
}
