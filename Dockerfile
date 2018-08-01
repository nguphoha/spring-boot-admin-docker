#Clone project
FROM alpine/git as clone 
WORKDIR /opt
RUN git clone https://github.com/nguphoha/spring-boot-admin-docker

#build project
FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY --from=clone /app/spring-petclinic /app 
RUN mvn install

#run Project
FROM openjdk:8-jre-alpine

EXPOSE 8080

WORKDIR /opt
COPY target/SpringBoot-Admin-*.jar /opt/spring-boot-admin-docker.jar

ENTRYPOINT ["java", "-jar", "spring-boot-admin-docker.jar"]