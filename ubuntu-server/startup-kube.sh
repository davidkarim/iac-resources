#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install jq nodejs net-tools snapd -y
sudo snap install microk8s --classic
sudo snap install kubectl --classic
sudo usermod -a -G microk8s $USER
microk8s.enable dashboard
sudo usermod -a -G microk8s ubuntu
sudo chown -R ubuntu ~/.kube
mkdir /home/ubuntu/.kube
microk8s config | sudo tee -a /home/ubuntu/.kube/config
microk8s config | sudo tee -a /root/.kube/config
