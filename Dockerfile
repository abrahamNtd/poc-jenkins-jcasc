FROM jenkins/jenkins:2.375.3
LABEL maintainer="agmc22mx@gmail.com"
USER root
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY jenkins-configuration.yaml /var/jenkins_home/jenkins-configuration.yaml
COPY seedjob.groovy /usr/local/seedjob.groovy
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/jenkins-configuration.yaml
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt