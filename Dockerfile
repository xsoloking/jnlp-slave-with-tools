FROM cloudbees/jnlp-slave-with-java-build-tools:3.0.0

USER root

RUN apt-get update && apt-get -qq install python2 && apt-get clean

USER jenkins
