resource "aws_eks_node_group" "ssc_eks_ng" {
  cluster_name    = "${var.eks-cluster}"
  node_group_name = "${var.nodegroup-name}"
  node_role_arn   = "${var.node-role}"
  subnet_ids      = "${var.subnet-ids}"
  #instance_type = "${var.instancetype}"
  ami_type = "${var.ami}"
  force_update_version = true
  #capacity_type = "${var.capacity-type}"
   launch_template {
     name = "${var.ltname}"
     version = "${var.ltversion}"
   }
  tags = {
      Name = "Workernode"
      SupportTeam = "EICC"
      Application= "EI Overhaul"
      "Patch Group" = "99"
      Project = "AWS EJ EIO Platform"
      Criticality = "Tier 1"
      CostOwnerTeam = "EICC"
      Compliance = "Validated"
      Owner = "Nandini"
      "kubernetes.io/cluster/test-r-three" = "owned"
  }
  scaling_config {
    desired_size = "${var.desiredsize}"
    max_size     = var.maxsize
    min_size     = var.minsize
  }
  update_config {
    max_unavailable = 1
  }
  //depends_on = [aws_launch_template.cluster]
}


# output "launchtemplateid" {
#   value = "${aws_eks_node_group.ssc_eks_ng.launch_template[0].*}"
# }