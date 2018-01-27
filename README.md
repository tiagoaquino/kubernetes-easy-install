# Kubernetes (Single Node)
## How to install kubernetes with Container Linux Config Files
### Installation steps:
1. Download the latest ISO image from CoreOS Container Linux: https://stable.release.core-os.net/amd64-usr/current/coreos_production_iso_image.iso

2. Create a VM and boot up with this iso image. 
   PS: The VM needs an internet connection to download kubernetes on first start boot.

3. When the system starts then copy these project files to a folder like `/home/core/kube` (This folder will be assumed in next steps).

4. Generate SSH key pairs to CoreOS using `ssh-keygen`. The public ssh key can be set on next step.

5. Customize the installation by editing the ENVVARS in file `/home/core/kube/kube-install.sh`    
    * Possible variables:
    ``` bash
    # Variables
    export KUBE_SERVER_IP=192.168.0.70
    export CLUSTER_IP_RANGE=10.100.0.0/16
    export DNS_SERVICE_IP=10.100.0.10
    export DOCKER_INSECURE_REGISTRY=192.168.0.0/24
    export KUBERNETES_VERSION=v1.9.2
    export PUBLIC_SSH_KEY=ssh-rsa AAAAB3Nz...
    ```
6. Run the installer: `sudo /home/core/kube/./kube-install.sh`.

7. When the install is done, reboot the system: `sudo restart`.

Just this!

## Features:
  - DNS
  - NodePorts
  - ConfigMaps and Secrets
  - Ingress
  - Light
  - External IP

---

Enjoy it!

Thanks to: 
- João Carlos Morais Júnior (Kubernetes' Papa) [@jcmoraisjr](https://github.com/jcmoraisjr)
- Johan Haleby (bash-templater) [@johanhaleby](https://github.com/johanhaleby)
