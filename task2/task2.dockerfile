# Use an official OpenJDK runtime as a parent image
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the compiled Java application JAR file into the container
COPY target/my-app.jar .

# Expose the port on which the application will run (if necessary)
EXPOSE 8080

# Run the Java application when the container launches
CMD ["java", "-jar", "my-app.jar"]