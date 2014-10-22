# VERSION 0.2
# DOCKER-VERSION 0.3.4
# To build:
# 1. Install docker (http://docker.io)
# 2. Checkout source: git@github.com:gasi/docker-node-hello.git
# 3. Build container: docker build .

FROM    centos:centos6

#add terabithia for xymon
ADD ./terabithia.repo /etc/yum.repos.d/terabithia.repo

# Enable EPEL and build yum's cache
RUN     rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm && yum makecache

# RUN ls -l /usr/sbin/fping ; echo 0 > /selinux/enforce ; cat /selinux/enforce || true

#install epel fping first, because terabithia fping errors. 
RUN yum -y install fping-2.4b2-10.el6.x86_64
RUN yum install -y xymon || true
# #fping failed..but fping is installed...so hack around that for now
# #...file gets put in place, but rpm fails on cpio problem
# #but it doesnt get suid
#
# #Error unpacking rpm package fping-3.10-2.el6.x86_64
# #error: unpacking of archive failed on file /usr/sbin/fping: cpio: cap_set_file

ADD ./start-httpd.sh /root/start-httpd.sh
ADD ./start-xymon.sh /root/start-xymon.sh
ADD ./hosts.cfg /etc/xymon/hosts.cfg


EXPOSE 80

CMD ["/bin/bash", "/root/start-xymon.sh"]

#now we need to run httpd and xymon in the forground?

#CMD ["service xymon start && service httpd start"]

# # Install Node.js and npm
# RUN     yum install -y npm

# # App
# ADD . /src
# # Install app dependencies
# RUN cd /src; npm install

# EXPOSE  8080
# CMD ["node", "/src/index.js"]


