# Use a more recent version of the OpenJDK image
FROM openjdk:8-jdk-alpine

# Expose the port the app will run on
EXPOSE 8080

# Set the environment variable for the app home directory
ENV APP_HOME /usr/src/app

# Copy the compiled JAR file into the container
COPY target/secretsanta-0.0.1-SNAPSHOT.jar $APP_HOME/app.jar

# Set the working directory
WORKDIR $APP_HOME

# Run the app using Java, ensuring the JAR file is executed as the entrypoint
ENTRYPOINT exec java -jar app.jar
