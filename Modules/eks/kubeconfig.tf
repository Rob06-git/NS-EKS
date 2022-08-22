resource "null_resource" "kubectl" {
depends_on = [
    resource.aws_iam_role.eks_cluster,
]
}

/*   
provisioner "local-exec" {
command = "aws eks --region us-east-1 update-kubeconfig --name ns_cluster"
}
*/
