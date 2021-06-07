FROM cloudbees/jnlp-slave-with-java-build-tools:3.0.0

USER root

RUN apt-get update && apt-get -qq install python2 && apt-get clean

RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py && python2 get-pip.py && rm -f  get-pip.py

USER jenkins
