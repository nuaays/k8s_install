##### Upgrade Linux Kernel
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh https://mirrors.tuna.tsinghua.edu.cn/elrepo/kernel/el7/x86_64/RPMS/elrepo-release-7.0-3.el7.elrepo.noarch.rpm
yum --disablerepo="*" --enablerepo="elrepo-kernel" list available
yum --enablerepo=elrepo-kernel install -y kernel-ml kernel-ml-devel #yum --enablerepo=elrepo-kernel install -y kernel-lt kernel-lt-devel
awk -F\' '$1=="menuentry " {print i++ " @ " $2}' /etc/grub2.cfg
grub2-set-default 0
rpm -qa | grep kernel
