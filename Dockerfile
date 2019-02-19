# Alpine Linux with OpenJDK JRE
FROM checkstyle/sonarqube-maven-git
# Add the working directory
ADD / /opt/sonarqube/
RUN pwd
WORKDIR /opt/sonarqube
#Build war file
RUN mvn clean install --quiet
RUN ls -l target/
RUN pwd
# copy WAR into image
COPY /opt/sonarqube/target/spring-boot-app-0.0.1-SNAPSHOT.war /app.war 
# run application with this command line 
CMD ["/usr/bin/java", "-jar", "-Dspring.profiles.active=default", "/app.war"]
