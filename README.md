
## create centos servers using vagrant
* Vagrantfile

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

nodes_num=4
box_name="centos7"

Vagrant.configure("2") do |config|

  (1..nodes_num).each do |i|
    config.vm.define "k8s#{i}" do |s|
      s.vm.box = box_name
      s.vm.box_check_update = false
      s.vm.hostname = "k8s#{i}"
      s.ssh.forward_agent = true

      s.vm.provider :virtualbox do |vb|
        vb.name = "k8s#{i}"
        vb.customize ["modifyvm", :id, "--vram", "16"]
        vb.customize ["modifyvm", :id, "--memory", "1024", "--cpus", "1",  "--cpuexecutioncap", "50" ]
      end


      s.vm.provision "file", source: "./packages", destination: "/tmp/packages"

      s.vm.provision "shell", privileged: true, inline: <<-SHELL
        sudo yum install -y net-tools-2.0-0.22.20131004git.el7.x86_64
        #sudo yum localinstall http://mirrors.aliyun.com/epel/7/x86_64/Packages/h/htop-2.0.2-1.el7.x86_64.rpm
        # sudo yum localinstall -y /tmp/packages/git/*.rpm
        # sudo yum localinstall -y /tmp/packages/policycoreutils-python/*.rpm
        # sudo yum localinstall -y /tmp/packages/docker-ce-17.12.0.ce-1.el7.centos.x86_64/*.rpm
        sudo echo vagrant:vagrant |chpasswd
        sudo echo root:vagrant |chpasswd
        sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
        sudo sed -i 's/PasswordAuthentication no/#PasswordAuthentication no/'   /etc/ssh/sshd_config
        sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
        sudo sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/'               /etc/ssh/sshd_config
        sudo systemctl restart sshd.service
      SHELL

      s.vm.network "private_network", ip: "192.168.56.10#{i}", netmask: "255.255.255.0", auto_config: true
    end

  end


end
```


* commands

```bash
cd /localdisk/k8s_v1.9.0
vagrant up
```

## init k8s using ansible-playbook
```
sudo ansible-playbook -i hosts -u root -k 01.prepare.yml  -vvvv
sudo ansible-playbook -i hosts -u root -k 02.etcd.yml  -vvvv
sudo ansible-playbook -i hosts -u root -k 03.kubectl.yml  -vvvv
sudo ansible-playbook -i hosts -u root -k 04.docker.yml  -vvvv

sudo ansible-playbook -i hosts -u root -k 06.kube-image.yml  -vvvv
sudo ansible-playbook -i hosts -u root -k 05.kube-master.yml  -vvvv
sudo ansible-playbook -i hosts -u root -k 06.kube-node.yml  -vvvv

sudo ansible-playbook -i hosts -u root -k 07.calico.yml  -vvvv
sudo ansible-playbook -i hosts -u root -k 07.flannel.yml  -vvvv
```



## Reference
* https://github.com/gjmzj/kubeasz





