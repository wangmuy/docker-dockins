# https://stackoverflow.com/questions/44791060/run-jenkins-pipeline-agent-with-sudo/49488813#49488813
FROM jenkinsci/blueocean:1.14.0
USER root

COPY alpine.repositories /etc/apk/repositories
RUN apk update && apk add sudo shadow docker
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER jenkins

