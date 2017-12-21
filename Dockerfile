FROM paas-docker-artifactory.gannettdigital.com/paas-centos7-base:latest
MAINTAINER Paas-Success <paas-success@gannett.com>

RUN yum clean all
RUN yum -y install initscripts && yum clean all
RUN yum update -y

RUN yum install -y dnsmasq bind-utils vim

ENV container docker
COPY 3031.net /etc/dnsmasq.d/3031.net
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
