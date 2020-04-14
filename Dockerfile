FROM tomcat:8.5-alpine
ADD target/narendra-mvn.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run","docker run -p 80:8080 narendra-mvn"]



