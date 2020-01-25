#!/bin/bash

apt update
apt -y upgrade

# install optional extras
#apt -y install build-essential
#apt -y install python
#apt -y install python-dev
#apt -y install python-pip
#apt -y install nano
#apt -y install vim
#apt -y install emacs
#apt -y install iputils-ping
#apt -y install dnsutils

#pip install glances

apt -y install wget
apt -y install curl
apt -y install git

apt-get -y install gnupg2
apt-get -y install ca-certificates
apt-get -y install apt-transport-https
apt-get -y install software-properties-common
apt-get -y install python-software-properties

# install docker
curl -s https://download.docker.com/linux/debian/gpg --output docker.gpg
apt-key add docker.gpg
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt-get update
apt-get -y install docker-ce=17.03.2~ce-0~debian-jessie
rm -f docker.gpg

# install crictl
VERSION="v1.0.0-beta.1"
wget https://github.com/kubernetes-incubator/cri-tools/releases/download/$VERSION/crictl-$VERSION-linux-amd64.tar.gz
tar zxvf crictl-$VERSION-linux-amd64.tar.gz -C /usr/local/bin
rm -f crictl-$VERSION-linux-amd64.tar.gz

# install k8s
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg --output kube.gpg
apt-key add kube.gpg
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
apt-get install -y kubelet kubeadm kubectl kubernetes-cni
rm -f kube.gpg
