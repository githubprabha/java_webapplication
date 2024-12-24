FROM openjdk:17-alpine
WORKDIR /build
COPY target/app-0.0.1-SNAPSHOT.jar /build
ENTRYPOINT ["java", "-jar", "app-0.0.1-SNAPSHOT.jar"]
EXPOSE 8080