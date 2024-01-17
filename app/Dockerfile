# Stage 1: Build the application using Maven
FROM maven:3.8.6-openjdk-11-slim as BUILD_IMAGE

# Set the working directory
WORKDIR /app

# Clone the application repository
# RUN git clone https://github.com/jadonharsh109/GitOps-Master-Actions

COPY . .

# Build the application using Maven
RUN mvn install 

# Stage 2: Create the runtime image with Tomcat
FROM tomcat:9-jre11

# Create a non-root user and group for security
# RUN 
# RUN groupadd -r tom_grp && useradd -g tom_usr tom_grp

# # Set ownership of Tomcat directories to the non-root user
# RUN chown -R tom_usr:tom_grp /usr/local/tomcat

# # Switch to the non-root user for further actions
# USER tom_usr

# Remove any existing webapps to avoid conflicts
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR file from the build stage
COPY --from=BUILD_IMAGE /app/target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war

# Define the default command to start Tomcat
CMD ["catalina.sh", "run"]

# Expose port 8080 for incoming traffic
EXPOSE 8080
