terraform {
    required_provides {
        docker = {
            source = "kreuwerker/docker"
            version = "~> 2.16.0"
        }
    }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

