output "eksngdepends" {
  value = {}
  depends_on = [
    aws_eks_node_group.ssc_eks_ng
  ]
}
