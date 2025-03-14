terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.36.0"
    }
  }
}
# Provider configuration
provider "kubernetes" {
  config_path = "~/.kube/config"  # Path to your kubeconfig file
  config_context = "minikube"
}

resource "kubernetes_namespace" "terraform-namespace" {
  metadata {
    name = "terraform"
  }
}

resource "kubernetes_deployment" "terraform-deployment" {
  metadata {
    name = "terraform-deployment"
    labels = {
      test = "DemoApp"
    }
    namespace = "terraform"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        test = "DemoApp"
      }
    }

    template {
      metadata {
        labels = {
          test = "DemoApp"
        }
      }

      spec {
        container {
          image = "nginx:1.27.4"
          name  = "nginx"

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "terraform-service" {
  metadata {
    name = "terraform-service"
    namespace = "terraform"
  }

  spec {
    selector = {
      test = "DemoApp"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }  
}