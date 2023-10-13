output "eks-name" {
  value = "${aws_eks_cluster.ssc_eks.name}"
}

output "cluster-sg-id" {
  value = "${aws_eks_cluster.ssc_eks.vpc_config[0].cluster_security_group_id}"
}

output "eksdepends" {
  value = {}
  depends_on = [aws_eks_cluster.ssc_eks]
}
