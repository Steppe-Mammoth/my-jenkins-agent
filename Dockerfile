FROM jenkins/ssh-agent:jdk11

USER root

RUN chown jenkins:jenkins /home/jenkins &&  chown jenkins:jenkins /home/jenkins/*
