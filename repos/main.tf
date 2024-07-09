provider "google" {
  project = "brio-lab-nzb"
  region  = "asia-south1"
}

# Create a VPC network
resource "google_compute_network" "my_vpc_network" {
  name                    = "my-vpc-network"
  auto_create_subnetworks = false  
  routing_mode            = "GLOBAL"  
  description             = "This is a VPC network"
  mtu                     = 1460 
}

# Create a public subnet
resource "google_compute_subnetwork" "public_subnet" {
  name          = "public-subnet"
  region        = "asia-south1"
  network       = google_compute_network.my_vpc_network.self_link
  ip_cidr_range = "10.0.1.0/24"  
  depends_on    = [google_compute_network.my_vpc_network]
}
