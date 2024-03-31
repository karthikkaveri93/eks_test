module "vpc" {
    source  = "terraform-aws-modules/vpc/aws"
    version = "5.7.0"

    azs = data.aws_availability_zones.azs.names

    private_subnets = var.private_subnets
    public_subnets = var.public_subnets
 

single_nat_gateway = true
enable_nat_gateway = true
enable_dns_hostnames = true
enable_dns_support = true


tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }

}

locals {
  cluster_name = "karthik-cluster-${random_string.example.result}"

}
resource "random_string" "example" {
    length = "10"
    special = false
}


