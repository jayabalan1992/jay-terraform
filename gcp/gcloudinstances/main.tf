// Configure the Google Cloud provider
provider "google" {
 credentials = "${file("gcpkeys.json")}"
 project     = "puppet-226118"
 region      = "us-east1"
 zone        = "us-east1-b"
}

resource "random_id" "instance_id" {
 byte_length = 8
}

resource "google_compute_instance" "vm_instance" {
  name         = "jay-${random_id.instance_id.hex}"
  machine_type = "custom-1-1024"
  tags         = ["http-server"]

  boot_disk {
    initialize_params {
      image = "centos-7-v20190326"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config = {
    }
  }

  connection {
    type        = "ssh"
    user        = "jayabalanbala"
    private_key = "${file("D:/GitHubProjects/jay-terraform/gcloudpri.pem")}"
  }
   
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "file" {
    source      = "puppet.conf"
    destination = "/tmp/puppet.conf"
  }
  provisioner "remote-exec" {
    script = "script.sh"
  }
}  
