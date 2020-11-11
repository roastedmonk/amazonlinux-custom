FROM amazonlinux:latest

RUN yum update -y
RUN touch /etc/yum.repos.d/google-chrome.repo
RUN echo -e "[google-chrome]\nname=google-chrome\nbaseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\ngpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub" >> /etc/yum.repos.d/google-chrome.repo
RUN touch /etc/yum.repos.d/centos.repo
RUN echo -e "[CentOS-base]\nname=CentOS-6 - Base\nmirrorlist=http://mirrorlist.centos.org/?release=6&arch=x86_64&repo=os\ngpgcheck=1\ngpgkey=http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-6\n\n" >> /etc/yum.repos.d/centos.repo
RUN echo -e "#released updates\n[CentOS-updates]\nname=CentOS-6 - Updates\nmirrorlist=http://mirrorlist.centos.org/?release=6&arch=x86_64&repo=updates\ngpgcheck=1\ngpgkey=http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-6\n\n" >> /etc/yum.repos.d/centos.repo
RUN echo -e "#additional packages that may be useful\n[CentOS-extras]\nname=CentOS-6 - Extras\nmirrorlist=http://mirrorlist.centos.org/?release=6&arch=x86_64&repo=extras\ngpgcheck=1\ngpgkey=http://mirror.centos.org/centos/RPM-GPG-KEY-CentOS-6\n" >> /etc/yum.repos.d/centos.repo
RUN yum install -y google-chrome-stable
RUN curl -sL https://rpm.nodesource.com/setup_12.x | bash -
RUN yum -y install nodejs
RUN yum -y install gcc-c++ make
RUN yum -y install unzip
RUN wget https://chromedriver.storage.googleapis.com/86.0.4240.22/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN mv chromedriver /usr/local/bin/
RUN chmod +x /usr/local/bin/chromedriver
