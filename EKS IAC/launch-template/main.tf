resource "aws_launch_template" "lteks" {
  name = "${var.lt_name}"
  ebs_optimized = "${var.ebs_optimized}"
  #image_id = "${var.image_id}"
  instance_type = "${var.instance_type}"
  vpc_security_group_ids = ["${var.clustersg}"]
  #key_name = "ssc-key-dta-deploy"
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 20
    }
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "workernode"
      SupportTeam = "EICC"
      Application = "EI Overhaul"
      "Patch Group" = "99"
      Project = "AWS EJ EIO Platform"
      Criticality = "Tier 1"
      CostOwnerTeam = "EICC"
      Compliance = "Validated"
      Owner = "Bikram"
      "kubernetes.io/cluster/test-r-three" = "owned"
    }
  }
  }