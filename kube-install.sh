#!/bin/bash

# Variables
export KUBE_SERVER_IP=192.168.0.70
export CLUSTER_IP_RANGE=10.100.0.0/16
export DNS_SERVICE_IP=10.100.0.10
export DOCKER_INSECURE_REGISTRY=192.168.0.0/24
export KUBERNETES_VERSION=v1.9.2
export PUBLIC_SSH_KEY="ssh-rsa AAAAB3N..."

# Clean-up
rm -f ignition.yml
rm -f ignition.json
rm -f kube-install.yml
rm -f kubeconfig.yml

# Templater
./templater.sh ignition.yml.tmpl > ignition.yml
./templater.sh kube-install.yml.tmpl > kube-install.yml
./templater.sh kubeconfig.yml.tmpl > kubeconfig.yml

# Transpiler Contailer Linux Config
chmod +x ct-v0.6.1
./ct-v0.6.1 -in-file ignition.yml -out-file ignition.json --files-dir .

# CoreOS Install
coreos-install -d /dev/sda -i ignition.json
