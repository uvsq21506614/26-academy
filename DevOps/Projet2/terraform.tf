// Configure the Google Cloud provider
provider "google" {
 credentials = "${file("CREDENTIALS_FILE.json")}"
 project     = "robotic-facet-228109"
 region      = "europe-west1-b"
}

// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
 byte_length = 8
}

// A single Google Cloud Engine instance
resource "google_compute_instance" "default" {
 name         = "terraform-instance-1"
 machine_type = "n1-standard-2"
 zone         = "europe-west1-b"

 boot_disk {
   initialize_params {
     image = "ubuntu-os-cloud/ubuntu-1604-lts"
	 size ="30"
   }
 }
 
 metadata {
   sshKeys = "INSERT_USERNAME:${file("C:\\Users\\milks\\ssh\\id_rsa.pub")}"
 }
 


// Make sure flask is installed on all new instances for later steps
 metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; sudo apt install -y docker.io; sudo usermod -aG docker $USER; sudo docker run -d --restart unless-stopped -p 80:8080 rancher/server:v1.6.17;"



 network_interface {
   network = "default"

   access_config {
     // Include this section to give the VM an external ip address
	 
	 
   }
 }
 
}

// A single Google Cloud Engine instance
resource "google_compute_instance" "slave-1" {
 name         = "terraform-instance-2"
 machine_type = "n1-standard-2"
 zone         = "europe-west2-b"

 boot_disk {
   initialize_params {
     image = "ubuntu-os-cloud/ubuntu-1604-lts"
	 size ="30"
   }
 }
 
 metadata {
   sshKeys = "INSERT_USERNAME:${file("C:\\Users\\milks\\ssh\\id_rsa_slave_1.pub")}"
 }
 


// Make sure flask is installed on all new instances for later steps
 metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; sudo apt install -y docker.io; sudo usermod -aG docker $USER; "



 network_interface {
   network = "default"

   access_config {
     // Include this section to give the VM an external ip address
	 
	 
   }
 }
 
}



// A single Google Cloud Engine instance
resource "google_compute_instance" "slave-2" {
 name         = "terraform-instance-3"
 machine_type = "n1-standard-2"
 zone         = "europe-west2-b"

 boot_disk {
   initialize_params {
     image = "ubuntu-os-cloud/ubuntu-1604-lts"
	 size ="30"
   }
 }
 
 metadata {
   sshKeys = "INSERT_USERNAME:${file("C:\\Users\\milks\\ssh\\id_rsa_slave_2.pub")}"
 }
 


// Make sure flask is installed on all new instances for later steps
 metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; sudo apt install -y docker.io; sudo usermod -aG docker $USER; "



 network_interface {
   network = "default"

   access_config {
     // Include this section to give the VM an external ip address
	 
	 
   }
 }
 
}

resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = "default"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  source_tags = ["web"]
}

resource "google_compute_disk" "default" {
  name  = "test-disk"
  type  = "pd-ssd"
  zone  = "europe-west2-b"
  image = "ubuntu-os-cloud/ubuntu-1604-lts"
  labels {
    environment = "dev"
  }
}


// A variable for extracting the external ip of the instance
output "ip" {
 value = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"
}

// A variable for extracting the external ip of the instance
output "ip-S-1" {
 value = "${google_compute_instance.slave-1.network_interface.0.access_config.0.nat_ip}"
}


// A variable for extracting the external ip of the instance
output "ip-S-2" {
 value = "${google_compute_instance.slave-2.network_interface.0.access_config.0.nat_ip}"
}




