#!/bin/bash
sudo apt-get update -y
sudo apt-get install jq nodejs net-tools -y
sudo apt install docker.io
sudo apt install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl


sudo apt install -y containerd
sudo modprobe br_netfilter

sudo sysctl net.bridge.bridge-nf-call-iptables=1
sudo sysctl net.ipv4.ip_forward=1

echo 'net.bridge.bridge-nf-call-iptables = 1' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.conf

# Apply changes to /etc/sysctl.conf
sudo sysctl --system

sudo kubeadm init --pod-network-cidr=10.244.0.0/16

