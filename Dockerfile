FROM ubuntu:latest
MAINTAINER "teja"
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y vim
RUN apt-get install -y openjdk-21-jdk 
RUN wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.28/bin/apache-tomcat-10.1.28.tar.gz
RUN tar -zxvf apache-tomcat-10.1.28.tar.gz
RUN mv apache-tomcat-10.1.28 tomcat
RUN mkdir -p /home/satya
RUN mv /tomcat /home/satya
COPY webapp/target/webapp.war /home/satya/tomcat/webapps
EXPOSE 8080
ENTRYPOINT sh /home/satya/tomcat/bin/startup.sh && bash
