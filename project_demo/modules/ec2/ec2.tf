resource "aws_instance" "myec2" {
  ami           = "ami-0ed9277fb7eb570c9"
  instance_type = lookup(var.environment_to_size_map,terraform.workspace)

}