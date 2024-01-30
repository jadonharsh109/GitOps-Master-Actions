# Stage 1: Build the application using Maven tool
FROM maven:3.8.6-openjdk-11-slim as BUILD_IMAGE

# Set the working directory
WORKDIR /app

# Copying files from host to docker container images
COPY . .

# Build the application using Maven
RUN mvn install 

# Stage 2: Create the runtime image with Tomcat
FROM tomcat:9-jre11

# Remove any existing webapps to avoid conflict
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR file from the build stage
COPY --from=BUILD_IMAGE /app/target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war

# Define the default command to start Tomcat
CMD ["catalina.sh", "run"]

# Expose port 8080 for incoming traffic
EXPOSE 8080
