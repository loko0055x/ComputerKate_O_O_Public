
# Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
# Click nbfs://nbhost/SystemFileSystem/Templates/Other/Dockerfile to edit this template


FROM tomcat:8.5-jdk8

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/ComputerKate_O_O-ProyEA1.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080

CMD ["catalina.sh", "run"]