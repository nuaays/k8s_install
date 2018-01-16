## apiserver

```bash
/hyperkube apiserver --advertise-address=172.17.0.6 --etcd-servers=https://172.17.0.6:2379,https://172.17.0.7:2379 --etcd-quorum-read=true --etcd-cafile=/etc/ssl/etcd/ssl/ca.pem --etcd-certfile=/etc/ssl/etcd/ssl/node-node1.pem --etcd-keyfile=/etc/ssl/etcd/ssl/node-node1-key.pem --insecure-bind-address=127.0.0.1 --apiserver-count=1 --admission-control=NamespaceLifecycle,LimitRanger,ServiceAccount,DefaultStorageClass,ResourceQuota --service-cluster-ip-range=10.233.0.0/18 --service-node-port-range=30000-32767 --client-ca-file=/etc/kubernetes/ssl/ca.pem --basic-auth-file=/etc/kubernetes/users/known_users.csv --tls-cert-file=/etc/kubernetes/ssl/apiserver.pem --tls-private-key-file=/etc/kubernetes/ssl/apiserver-key.pem --token-auth-file=/etc/kubernetes/tokens/known_tokens.csv --service-account-key-file=/etc/kubernetes/ssl/apiserver-key.pem --secure-port=6443 --insecure-port=8080 --storage-backend=etcd3 --v=5 --allow-privileged=true --anonymous-auth=False
```

## kubelet

```bash
/hyperkube kubelet --v=5 --address=172.17.0.6 --hostname-override=node1 --allow-privileged=true --pod-manifest-path=/etc/kubernetes/manifests --pod-infra-container-image=gcr.io/google_containers/pause-amd64:3.0 --kube-reserved cpu=100m,memory=512M --node-status-update-frequency=10s --enable-cri=False --cgroups-per-qos=False --enforce-node-allocatable= --cluster-dns=10.233.0.3 --cluster-domain=cluster.local --resolv-conf=/etc/resolv.conf --kubeconfig=/etc/kubernetes/node-kubeconfig.yaml --require-kubeconfig --node-labels=node-role.kubernetes.io/master=true,node-role.kubernetes.io/node=true --network-plugin=cni --network-plugin-dir=/etc/cni/net.d --cni-bin-dir=/opt/cni/bin
```

## proxy

```bash
/hyperkube proxy --v=5 --master=http://127.0.0.1:8080 --bind-address=172.17.0.6 --cluster-cidr=10.233.64.0/18 --proxy-mode=iptables
```





## sidecar

```bash
/sidecar --v=5 --logtostderr --probe=kubedns,127.0.0.1:10053,kubernetes.default.svc.cluster.local,5,A --probe=dnsmasq,127.0.0.1:53,kubernetes.default.svc.cluster.local,5,A
```

## dnsmasq

```bash
/dnsmasq-nanny -v=5 -logtostderr -configDir=/etc/k8s/dns/dnsmasq-nanny -restartDnsmasq=true -- -k --cache-size=1000 --log-facility=- --server=/cluster.local/127.0.0.1#10053 --server=/in-addr.arpa/127.0.0.1#10053 --server=/ip6.arpa/127.0.0.1#10053
```

## kube-dns

```bash
/kube-dns --domain=cluster.local. --dns-port=10053 --config-dir=/kube-dns-config --v=5
```

## autoscaler

```bash
/cluster-proportional-autoscaler --namespace=kube-system --configmap=kubedns-autoscaler --target=Deployment/kube-dns --default-params={\"linear\":{\"nodesPerReplica\":10,\"min\":2}} --logtostderr=true --v=2
```

