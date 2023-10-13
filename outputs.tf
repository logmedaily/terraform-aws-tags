output "all_tags" {
  value = merge(var.global_tags)
  description = "Merged output of all input tags"
}
