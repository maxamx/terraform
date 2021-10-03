terraform{
    required_providers{
        digitalocean={
            source = "digitalocean/digitalocean"
            version = "~> 2.0"
        }
    }
}

variable "do_token" {
    
  
}

provider "digitalocean"{
    token=var.do_token
}



resource "digitalocean_kubernetes_cluster" "k8s" {
  name   = "k8s"
  region = "nyc1"
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.21.3-do.0"

  node_pool {
    name       = "default-pool"
    size       = "s-2vcpu-2gb"
    node_count = 2
  }

  
}