resource "local_file" "products" {
  content  = "Product list goes here"
  filename = "products.txt"
}