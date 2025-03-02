FROM jenkins/ssh-agent:jdk17

#SWITCH USER TO ROOT
USER root

RUN chown jenkins:jenkins /home/jenkins && chown jenkins:jenkins /home/jenkins/.ssh/

RUN apt-get update

# INSTALL DOCKER
RUN apt-get -y install apt-transport-https ca-certificates curl software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get -y update && \
    apt-get -y install docker-ce

RUN usermod -a -G docker jenkins && usermod -a -G systemd-network jenkins
