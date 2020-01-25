#!/bin/bash

# init k8s master
kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=192.168.33.10

# setup kubectl as vagrant user
su -c 'mkdir -p /home/vagrant/.kube' vagrant
su -c 'sudo cp -i /etc/kubernetes/admin.conf /home/vagrant/.kube/config' vagrant
su -c 'sudo chown $(id -u):$(id -g) /home/vagrant/.kube/config' vagrant

# kubectl ops as vagrant user
su -c 'git clone https://github.com/coreos/flannel.git' vagrant
su -c 'kubectl apply -f flannel/Documentation/kube-flannel.yml' vagrant
su -c 'kubectl create serviceaccount my-dashboard-sa' vagrant
su -c 'kubectl create clusterrolebinding my-dashboard-sa --clusterrole=cluster-admin --serviceaccount=default:my-dashboard-sa' vagrant
su -c 'kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml' vagrant
