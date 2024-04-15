FROM jenkins/ssh-agent:jdk11

USER root
RUN chown jenkins:jenkins /home/jenkins &&  chown jenkins:jenkins /home/jenkins/*

RUN apt-get update

# DOCKER REPO

RUN apt-get -y install apt-transport-https ca-certificates curl software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get -y update
 

# DOCKER PACK
RUN apt-get -y install docker-ce

