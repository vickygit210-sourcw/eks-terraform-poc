module "eks-node" {
   source = "../eks-Nodegroup"
   eks-cluster = eks-name
   depends_on = [module.launch_template.ltdepends]
   node-role = "arn:aws:iam::757671657525:role/AmazonEKSNodeRole"
   nodegroup-name = "test-group-b"
   subnet-ids = ["subnet-0a733613cbcd25a2f","subnet-0119cdea63e99173c"]
   #instancetype = "t3.medium"
   ami = "BOTTLEROCKET_x86_64"
   disk-size = "20"
   desiredsize = "3"
   maxsize = "4"
   minsize = "1"
   #capacity-type = "${var.capacity-type}"
   ltname = module.launch_template.lt_name
   ltversion = module.launch_template.lt_version
   #Tags
}
module "launch_template" {
  source = "../launch-template"
  ebs_optimized = false
  #image_id = "ami-08863056f2ff03fad"
  instance_type = "t3.medium"
  lt_name = "EKS_LT_workload"
  #worker_node = "${var.worker_node}"
  #eks-sg-name = "${var.eks-sg-name}"
  #security-gp-id="${[data.aws_security_group.secgp.id]}"
  eks-cluster-name = eks-name
  #clustersg = "sg-0b7c6032587e144af"
  region      = "eu-west-1"
  #nodegroupname = "${var.nodegroup-name}"
}
