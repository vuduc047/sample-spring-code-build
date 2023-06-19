# Use a base image that includes Java 17 and Maven
FROM maven:3.9.1-amazoncorretto-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src/ ./src/
RUN mvn clean install

# Start a new container with Java 17 and Alpine Linux, with Amazon Corretto
FROM amazoncorretto:17-alpine
WORKDIR /app
COPY --from=build "/app/target/*.jar" /app/
EXPOSE 6969
ENTRYPOINT java -jar *.jar