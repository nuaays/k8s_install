
docker pull geerong/pause-amd64:3.0
docker tag  geerong/pause-amd64:3.0 gcr.io/google_containers/pause-amd64:3.0

docker pull geerong/etcd-amd64:3.0.17
docker tag geerong gcr.io/google_containers/etcd-amd64:3.0.17

docker pull geerong/kube-proxy-amd64:v1.7.5
docker tag geerong/kube-proxy-amd64:v1.7.5 gcr.io/google_containers/kube-proxy-amd64:v1.7.5
docker pull geerong/kube-scheduler-amd64:v1.7.5
docker tag geerong/kube-scheduler-amd64:v1.7.5 gcr.io/google_containers/kube-scheduler-amd64:v1.7.5
docker pull geerong/kube-apiserver-amd64:v1.7.5
docker tag geerong/kube-apiserver-amd64:v1.7.5 gcr.io/google_containers/kube-apiserver-amd64:v1.7.5
docker pull geerong/kube-controller-manager-amd64:v1.7.5
docker tag geerong/kube-controller-manager-amd64:v1.7.5 gcr.io/google_containers/kube-controller-manager-amd64:v1.7.5



docker pull geerong/k8s-dns-kube-dns-amd64:1.14.4
docker tag geerong/k8s-dns-kube-dns-amd64:1.14.4 gcr.io/google_containers/k8s-dns-kube-dns-amd64:1.14.4

docker pull geerong/k8s-dns-sidecar-amd64:1.14.4
docker tag geerong/k8s-dns-sidecar-amd64:1.14.4 gcr.io/google_containers/k8s-dns-sidecar-amd64:1.14.4

docker pull geerong/k8s-dns-dnsmasq-nanny-amd64:1.14.4 
docker tag geerong/k8s-dns-dnsmasq-nanny-amd64:1.14.4  gcr.io/google_containers/k8s-dns-dnsmasq-nanny-amd64:1.14.4


docker pull geerong/kube-policy-controller:v0.6.0
docker tag geerong/kube-policy-controller:v0.6.0 quay.io/calico/kube-policy-controller:v0.6.0

docker pull geerong/kube-policy-controller:v0.7.0
docker tag geerong/kube-policy-controller:v0.7.0 quay.io/calico/kube-policy-controller:v0.7.0









cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64/
enabled=1
gpgcheck=0
EOF


yum list kubeadm –showduplicates
yum list kubernetes-cni –showduplicates
yum list kubelet –showduplicates
yum list kubectl –showduplicates



export K8SVERSION=1.7.5
sudo yum install -y "kubectl-${K8SVERSION}-0.x86_64" "kubelet-${K8SVERSION}-0.x86_64" "kubeadm-${K8SVERSION}-0.x86_64"



