FROM tomcat:8.5-alpine
ADD target/narendra-mvn.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["docker run -p 9085:8080 narendra-mvn","catalina.sh", "run"]

