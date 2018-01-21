

#ansible -i hosts deploy -m synchronize -a "src=/Users/charles/kubeasz/roles dest=/home/vagrant/kubeasz/roles compress=yes --exclude=.git"



rm -rf /Users/charles/.ssh/known_hosts && 
sshpass -p vagrant scp -v -o "StrictHostKeyChecking no" -r /Users/charles/kubeasz vagrant@192.168.56.104:/home/vagrant/kubeasz



