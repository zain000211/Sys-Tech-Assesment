# Use a base image with Java
FROM openjdk:11-jre-slim

# Set working directory inside the container
WORKDIR /app

# Copy the jar file into the container
COPY target/sample-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

# Command to run the application
CMD java -jar app.jar
