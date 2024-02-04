resource "helm_release" "argocd" {

  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.53.12"
  namespace  = "argocd"

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }

  set { # Argo CD server name
    name  = "server.name"
    value = "argocd-server"
  }

  depends_on = [
    terraform_data.k8s_namespace
  ]
}
