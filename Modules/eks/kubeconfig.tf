resource "null_resource" "kubectl" {
depends_on = [
    resource.aws_iam_role.eks_cluster,
]
}


