FROM cloudbees/jnlp-slave-with-java-build-tools:3.0.0

USER root

RUN curl https://storage.googleapis.com/kubernetes-release/release/v1.20.7/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl

RUN apt-get update && apt-get -qq install python2 && apt-get clean

RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py && python2 get-pip.py && rm -f  get-pip.py

USER jenkins
