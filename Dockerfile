FROM openjdk:8-jdk-alpine

# Expose the port that your app will use
EXPOSE 8088

# Set the working directory inside the container
ENV APP_HOME /usr/src/app

# Copy the JAR file to the container
COPY target/secretsanta-0.0.1-SNAPSHOT.jar $APP_HOME/app.jar

# Set the working directory
WORKDIR $APP_HOME

# Run the JAR file when the container starts
ENTRYPOINT ["java", "-jar", "app.jar"]
