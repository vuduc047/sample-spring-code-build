ARG CODEARTIFACT_AUTH_TOKEN
ENV CODEARTIFACT_AUTH_TOKEN = CODEARTIFACT_AUTH_TOKEN

# Use a base image that includes Java 17 and Maven
FROM maven:3.9.0 AS build
WORKDIR /app
COPY pom.xml .
COPY src/ ./src/
RUN mvn clean install
RUN echo CODEARTIFACT_AUTH_TOKEN
RUN mvn deploy -s settings.xml

# Start a new container with Java 17 and Alpine Linux, with Amazon Corretto
FROM maven:3.9.0-amazoncorretto-17
WORKDIR /app
COPY --from=build "/app/target/*.jar" /app/
EXPOSE 6969
ENTRYPOINT java -jar *.jar