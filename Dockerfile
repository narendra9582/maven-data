FROM tomcat:8.5-alpine
COPY settings.xml /usr/local/tomcat/conf/
COPY tomcat-users.xml /usr/local/tomcat/conf/
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/
EXPOSE 8080
ADD target/narendra-mvn.war /usr/local/tomcat/webapps/
CMD ["docker stop narendra-mvn","docker rm -f narendra-mvn ","docker run --name narendra-mvn -p 80:8080 f15a305bdbf7","catalina.sh", "run"]



