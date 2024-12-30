FROM openjdk:17-jdk-alpine
COPY ./target/app-0.0.1-SNAPSHOT.war 
EXPOSE 8080
