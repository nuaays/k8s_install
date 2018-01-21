
sudo ansible-playbook -i hosts -u root -k 88.site.yml  -vvvv



ansible -i hosts all -m shell -a "docker ps"



systemctl disable firewalld;systemctl stop firewalld;iptables -P FORWARD ACCEPT
systemctl stop kubelet
systemctl stop docker
iptables --flush
iptables -tnat --flush
systemctl start kubelet
systemctl start docker


kubectl logs --namespace=kube-system $(kubectl get pods --namespace=kube-system -l k8s-app=kube-dns -o name) -c kubedns
kubectl logs --namespace=kube-system $(kubectl get pods --namespace=kube-system -l k8s-app=kube-dns -o name) -c dnsmasq
kubectl logs --namespace=kube-system $(kubectl get pods --namespace=kube-system -l k8s-app=kube-dns -o name) -c sidecar



kubectl cluster-info

https://github.com/kubernetes/dashboard
kubectl proxy for dashboard
kubectl proxy --address=0.0.0.0 --port=8001 --accept-hosts='^.*'



http://192.168.56.101/api/v1/namespaces/kube-system/services/kubernetes-dashboard/proxy/


swagger api
http://192.168.56.101/swagger-ui/



KUBE_REPO_PREFIX=registry.cn-hangzhou.aliyuncs.com/google-containers


echo 3 > /proc/sys/vm/drop_caches


