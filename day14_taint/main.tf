resource "aws_instance" "sql_runner" {
  ami                    = "ami-0081f0d5081b58505" # Amazon Linux 2
  instance_type          = "t2.micro"
}



# # List all workspaces
# terraform workspace list

# # Create a new workspace
# terraform workspace new <workspace_name>

# # Select (switch to) an existing workspace
# terraform workspace select <workspace_name>

# # Show the current workspace
# terraform workspace show

# # Delete a workspace (cannot delete the currently active one)
# terraform workspace delete <workspace_name>
