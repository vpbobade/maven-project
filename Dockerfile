FROM tomcat:7
MAINTAINER = "vbobade@altimetrik.com"
WORKDIR /var/lib/jenkins/workspace/Q_pipeline
COPY webapp/target/*.war /usr/local/tomcat/webapps/
EXPOSE 9000

FROM java:8
EXPOSE 9001
ADD webapp/target/*.war webapp.war
ENTRYPOINT ["java", "-jar", "webapp.war"]
