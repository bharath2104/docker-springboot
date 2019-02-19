# Alpine Linux with OpenJDK JRE
FROM maven:3-jdk-8
# Add the working directory
ADD / /
#Build war file
RUN mvn clean install
# copy WAR into image
COPY target/spring-boot-app-0.0.1-SNAPSHOT.war /app.war 
# run application with this command line 
CMD ["/usr/bin/java", "-jar", "-Dspring.profiles.active=default", "/app.war"]
