FROM tomcat:8.5-alpine
#RUN apt-get update
#RUN apt-get install -y nano
RUN mkdir -p /usr/local/tomcat/conf
COPY tomcat-users.xml /usr/local/tomcat/conf/
#COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/

ADD target/narendra-mvn.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run","docker run -p 80:8080 narendra-mvn"]



