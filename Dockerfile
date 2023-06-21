# Use a base image that includes Java 17 and Maven
FROM maven:3.9.1 AS build
ARG TOKEN
ENV CODEARTIFACT_AUTH_TOKEN=$TOKEN
WORKDIR /app
COPY pom.xml .
COPY modules/ ./modules/
RUN ls /app
COPY settings.xml .
#RUN mvn clean install
RUN mvn deploy -s settings.xml

# Start a new container with Java 17 and Alpine Linux, with Amazon Corretto
FROM openjdk:17-alpine
WORKDIR /app
COPY --from=build "/app/modules/api/target/api-0.0.1-SNAPSHOT.jar" /app/
EXPOSE 6969
ENTRYPOINT java -jar *.jar