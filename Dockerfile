FROM openjdk:17-alpine
WORKDIR /app
COPY ./target/app-0.0.1-SNAPSHOT.war /app 
EXPOSE 8080
