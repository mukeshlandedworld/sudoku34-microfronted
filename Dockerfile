# Use the official Tomcat image as the base image
FROM tomcat:latest

# Copy your WAR file into the webapps directory of Tomcat
COPY target/sudoku34-web-app.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080 to allow external access to the Tomcat server
EXPOSE 8080

# Start Tomcat when the container starts
CMD ["catalina.sh", "run"]
