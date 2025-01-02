FROM maven AS build
RUN yum install git -y
WORKDIR /maven
RUN git clone https://github.com/githubprabha/java_webapplication.git /maven
RUN  mvn clean install

FROM openjdk:17-jdk
WORKDIR /app
COPY --from=build /maven/target/app-0.0.1-SNAPSHOT.war /app/app-0.0.1-SNAPSHOT.war
CMD ["java", "-jar", "app-0.0.1-SNAPSHOT.war"]
# ENTRYPOINT ["java", "-jar", "app-0.0.1-SNAPSHOT.war"]
EXPOSE 8080
