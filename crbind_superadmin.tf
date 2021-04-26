provider "kubernetes-alpha" {
  config_path = "~/.kube/config"
}

resource "kubernetes_manifest" "clusterrolebinding_temp_admin" {
  provider = kubernetes-alpha
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "ClusterRoleBinding"
    "metadata" = {
      "annotations" = {
        "rbac.authorization.kubernetes.io/autoupdate" = "true"
      }
      "name" = "rolebinding-superadmin"

    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind" = "ClusterRole"
      "name" = "superadmin_test"
    }
    "subjects" = [
      {
        "apiGroup" = "rbac.authorization.k8s.io"
        "kind" = "User"
        "name" = "wcp:10.118.131.192:administrator@vsphere.local"
      },
    ]
  }
}
