provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

#https://github.com/kubernetes-sigs/metrics-server/releases/tag/metrics-server-helm-chart-3.8.2
#https://github.com/kubernetes-sigs/metrics-server/blob/master/charts/metrics-server/README.md

resource "helm_release" "metrics-server" {
  name = "metrics-server"

  repository = "https://kubernetes-sigs.github.io/metrics-server/"
  chart      = "metrics-server"
  namespace  = "kube-system"
  version    = "3.8.2"

  set {
    name  = "metrics.enabled"
    value = false
  }
}
