resource "aws_eks_cluster" "ssc_eks" {
  name     = "${var.eks-cluster-name}"
  role_arn = "${var.cluster-role}"
  enabled_cluster_log_types = "${var.enable-cluster-log}"
  version = "${var.eks-version}"

  vpc_config {
    subnet_ids = "${var.subnet-ids}"
    endpoint_private_access = "${var.endpoint-private-access}"
    endpoint_public_access = "${var.endpoint-public-access}"
    security_group_ids = ["${var.eks-sg-name}"]
  }

  kubernetes_network_config {
    service_ipv4_cidr = "${var.eks-service-cidr}"
  }
#  encryption_config {
#    provider {
#     key_arn = "${var.key-arn}"
#    }
#    resources = ["secrets"]
#  }

  tags = {
      SupportTeam = "EICC"
      Application= "EI Overhaul"
      "Patch Group" = "99"
      Project = "AWS EJ EIO Platform"
      Criticality = "Tier 1"
      CostOwnerTeam = "EICC"
      Compliance = "Validated"
      Owner = "Nandini"
  }

  #timeouts {
    #create = "${var.create-time}"
    #delete = "${var.delete-time}"
    #update = "${var.update-time}"
  #}
}
