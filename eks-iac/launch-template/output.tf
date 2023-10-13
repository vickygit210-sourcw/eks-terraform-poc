output "lt_name" {
  value = "${aws_launch_template.lteks.name}"
}
output "lt_version" {
  value = "${aws_launch_template.lteks.latest_version}"
}
output "ltdepends" {
  value = {}
  depends_on = [
    aws_launch_template.lteks
  ]
}
