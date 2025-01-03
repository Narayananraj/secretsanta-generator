# Use official Tomcat image as base
FROM tomcat:9-jdk8-openjdk

# Expose Tomcat's default HTTP port
EXPOSE 8080

# Set the location for the WAR file to be copied to
ENV CATALINA_HOME /usr/local/tomcat

# Copy your WAR file into the Tomcat webapps directory
COPY target/secretsanta-0.0.1-SNAPSHOT.war $CATALINA_HOME/webapps/

# Optionally, you can configure the container to run a script when it starts.
# For example, you could add custom configuration files or commands here.
# By default, Tomcat will start when the container starts.

# Default command to run Tomcat
CMD ["catalina.sh", "run"]
