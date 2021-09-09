FROM jenkins/jnlp-slave:latest-jdk11

USER root

RUN apt-get update -qqy \
  && apt-get -qqy --no-install-recommends install \
    dnsutils iputils-ping telnet\
    openssh-client ssh-askpass\
    ca-certificates \
    tar zip unzip \
    wget curl \
    git \
    build-essential \
    less nano tree \
    python python-pip python2 groff python3-distutils\
    rlwrap \
  && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip setuptools \
  && curl https://bootstrap.pypa.io/pip/get-pip.py --output get-pip.py && python3 get-pip.py && rm -f get-pip.py \
  && pip3 install jenkins-job-builder  \
  && curl -sL https://deb.nodesource.com/setup_14.x | bash && apt-get install -y nodejs \
  && curl https://storage.googleapis.com/kubernetes-release/release/v1.20.7/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl
    
USER jenkins
