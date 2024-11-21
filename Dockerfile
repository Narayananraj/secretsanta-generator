
FROM openjdk:11-jre-slim


WORKDIR /app


COPY target/my-app.jar /app/my-app.jar


EXPOSE 8090

ENTRYPOINT ["java", "-jar", "my-app.jar"]
