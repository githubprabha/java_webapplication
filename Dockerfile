# FROM openjdk:17-alpine
# WORKDIR /build
# COPY target/app-0.0.1-SNAPSHOT.war /build
# ENTRYPOINT ["java", "-jar", "app-0.0.1-SNAPSHOT.war"]
# EXPOSE 8080



FROM amazonlinux
RUN yum install java-17 -y 
RUN yum install maven -y 
RUN yum install git -y 
WORKDIR /app
RUN git clone https://github.com/githubprabha/java_webapplication.git
RUN cd /app/java_webapplication
RUN mvn clean install
RUN chmod 777 /app/java_webapplication/shell.sh
ENTRYPOINT ["shell.sh"]
EXPOSE 8080
