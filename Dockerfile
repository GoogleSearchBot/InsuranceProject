FROM openjdk:11
COPY target/*.jar insureme.jar
RUN ["java", "-jar", "insureme.jar"]
