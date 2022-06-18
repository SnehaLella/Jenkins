FROM centos

MAINTAINER sureshcadm2015@gmail.com
USER root
RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz
RUN yum install wget -y 
RUN wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.35/bin/apache-tomcat-8.5.35.tar.gz 
RUN tar xvfz apache*.tar.gz 
RUN mv apache-tomcat-8.5*/* /opt/tomcat/. 
RUN yum -y install java 
EXPOSE 8080
COPY target/*.war /opt/tomcat/webapps/
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
