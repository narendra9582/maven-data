FROM tomcat:8.5-alpine
#COPY settings.xml /usr/local/tomcat/conf/
COPY tomcat-users.xml /usr/local/tomcat/conf/
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/
EXPOSE 8080
#CMD ["cd /usr/local/tomcat/conf/"]
#CMD ["mv tomcat-user.xml tomcat-user1"]
#COPY tomcat-users.xml /usr/local/tomcat/conf
ADD target/narendra-mvn.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]



