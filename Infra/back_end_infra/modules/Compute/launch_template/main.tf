resource "aws_launch_template" "node_lt" {
  name_prefix = "node-lt-"

  vpc_security_group_ids = concat(var.eks_cluster_sg_id,var.node_sg_id)
    block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = 20
      volume_type = "gp3"
      delete_on_termination = true
    }
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "node"
    }
  }
}