# Alpine Linux with OpenJDK JRE
FROM openjdk:8-jre-alpine
#Build war
RUN mvn clean install
# copy WAR into image
COPY target/spring-boot-app-0.0.1-SNAPSHOT.war /app.war 
# run application with this command line 
CMD ["/usr/bin/java", "-jar", "-Dspring.profiles.active=default", "/app.war"]
