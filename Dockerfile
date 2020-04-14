FROM tomcat:8.5-alpine
ADD settings.xml /usr/local/tomcat/conf/
ADD tomcat-users.xml /usr/local/tomcat/conf/
EXPOSE 8080
CMD ["cd /usr/local/tomcat/conf/"]
CMD ["mv tomcat-user.xml tomcat-user1"]
COPY tomcat-users.xml /usr/local/tomcat/conf
ADD target/narendra-mvn.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]



