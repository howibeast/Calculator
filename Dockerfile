FROM openjdk:11

# Install Xvfb
RUN apt-get update && \ 
    apt-get install -y xvfb libxrender1 libxtst6 libxi6

# Set the display variable
ENV DISPLAY=:1

# Start Xvfb
CMD ["Xvfb", ":1", "-screen", "0", "1920x1080x16"]

# Copy your application JAR file to the container
COPY target/Calculator-1.0-SNAPSHOT.jar /app.jar

# Run your Java application
CMD ["java", "-jar", "/app.jar"]

