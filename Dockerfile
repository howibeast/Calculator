# Use a base image with Java
FROM openjdk:11

# Install Xvfb and X11 utilities
RUN apt-get update && apt-get install -y xvfb x11-utils libxrender1 libxtst6 libxi6

# Set the display variable
ENV DISPLAY=:1

# Start Xvfb with an increased sleep time (e.g., 10 seconds)
CMD ["sh", "-c", "Xvfb :1 -screen 0 1920x1080x16 & sleep 10 && java -jar /app.jar"]

# Copy your application JAR file to the container
COPY target/Calculator-1.0-SNAPSHOT.jar /app.jar

