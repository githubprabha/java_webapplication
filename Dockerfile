FROM openjdk:17-alpine
WORKDIR /app
COPY ./target/app-0.0.1-SNAPSHOT.war /app 
CMD ["java","-jar","app-0.0.1-SNAPSHOT.war"]
EXPOSE 8080
