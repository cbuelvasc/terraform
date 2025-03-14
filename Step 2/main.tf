resource "local_file" "products" {
  count    = 5
  content  = "Product list goes here ${random_string.suffix[count.index].id}"
  filename = "products-${random_string.suffix[count.index].id}.txt"
}