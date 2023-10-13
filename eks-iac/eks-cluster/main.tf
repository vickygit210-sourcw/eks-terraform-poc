resource "aws_eks_addon" "kube_proxy" {
  addon_name        = "kube-proxy"
  addon_version     = "${var.kube_proxy_ver}"
  cluster_name = "${var.eks-cluster}"
  resolve_conflicts_on_create = "${var.resolve_conflicts_on_create}"
}

resource "aws_eks_addon" "core_dns" {
  addon_name        = "coredns"
  addon_version     = "${var.core_dns_ver}"
  resolve_conflicts_on_create = "${var.resolve_conflicts_on_create}"
  cluster_name = "${var.eks-cluster}"
}

resource "aws_eks_addon" "vpc_cni" {
  addon_name        = "vpc-cni"
  addon_version     = "${var.vpc_cni_ver}"
  resolve_conflicts_on_create = "${var.resolve_conflicts_on_create}"
  cluster_name = "${var.eks-cluster}"
}