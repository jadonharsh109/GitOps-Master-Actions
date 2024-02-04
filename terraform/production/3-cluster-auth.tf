// Cluster authentication & autherization related information
resource "terraform_data" "kubeconfig" {
  provisioner "local-exec" {
    when    = create
    command = "aws eks update-kubeconfig --name ${module.eks.cluster_name}" // This will pull the kubeconfig file from aws eks.
  }
  depends_on = [module.eks]
}

resource "terraform_data" "k8s_namespace" {
  provisioner "local-exec" {
    when    = create
    command = "kubectl create namespace argocd" // This will pull the kubeconfig file from aws eks.
  }
  depends_on = [terraform_data.kubeconfig]
}

data "aws_eks_cluster_auth" "eks" {
  name = module.eks.cluster_name
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

// Authenticating Helm to kubernetes cluster
provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    token                  = data.aws_eks_cluster_auth.eks.token
  }
}






