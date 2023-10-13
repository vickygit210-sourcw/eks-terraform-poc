module "eks" {
    source = "./eks-cluster"
    eks-cluster-name = "test-b-three"
    cluster-role = "arn:aws:iam::437563774624:role/eksClusterRole"
    enable-cluster-log = ["audit","api","authenticator"]
    eks-version = "1.27"
    subnet-ids = ["subnet-0376a6fb811c1df13","subnet-0b60756699823088c","subnet-004deac879746b5c1"]
    endpoint-private-access = true
    endpoint-public-access = false
    eks-service-cidr = "172.20.0.0/16"

    eks-sg-name = "sg-0441ad9fd634d17ed"
}

module "eks-node" {
   source = "./eks-Nodegroup"
   eks-cluster = module.eks.eks-name
   depends_on = [module.launch_template.ltdepends]
   node-role = "arn:aws:iam::437563774624:role/role_for_terraform"
   nodegroup-name = "test-group-b"
   subnet-ids = ["subnet-0376a6fb811c1df13","subnet-0b60756699823088c","subnet-004deac879746b5c1"]
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

module "eks-addons" {
   source = "./eks-addons"
   depends_on = [module.eks-node.eksngdepends]
   eks-cluster = module.eks.eks-name
   kube_proxy_ver = "v1.27.1-eksbuild.1"
   core_dns_ver = "v1.10.1-eksbuild.1"
   vpc_cni_ver = "v1.12.6-eksbuild.2"
   resolve_conflicts_on_create = "OVERWRITE"
}

module "launch_template" {
  source = "./launch-template"
  depends_on = [module.eks.eksdepends]
  ebs_optimized = false
  image_id = "ami-08863056f2ff03fad"
  instance_type = "t3.medium"
  lt_name = "EKS_LT_1_B"
  #worker_node = "${var.worker_node}"
  #eks-sg-name = "${var.eks-sg-name}"
  #security-gp-id="${[data.aws_security_group.secgp.id]}"
  eks-cluster-name = module.eks.eks-name
  clustersg = "sg-0441ad9fd634d17ed"
  region      = "eu-west-1"
  #nodegroupname = "${var.nodegroup-name}"
}