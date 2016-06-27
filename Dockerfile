# Oracle JDK8 Dockerfile, copied from https://github.com/dockerfile/java/blob/master/oracle-java8/Dockerfile because the official Oracle Java8 is not available in docker hub. 

# Pull base image.
FROM ubuntu:16.04

# disable interactive functions
ENV DEBIAN_FRONTEND noninteractive

# Install Java
RUN apt-get update && \
  apt-get dist-upgrade -y && \
  apt-get -y install software-properties-common && \
  add-apt-repository ppa:webupd8team/java && \
  apt-get update && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer && \
  apt-get purge -y --auto-remove software-properties-common && \
  apt-get clean


# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Define default command.
CMD ["bash"]

