https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file

exemplo:

    resource "local_file" "foo" {
    content  = "foo!"
    filename = "${path.module}/foo.bar"
    }