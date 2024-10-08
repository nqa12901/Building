# Build stage
FROM adoptopenjdk/maven-openjdk8:latest AS build

WORKDIR /app

# Copy pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy source code and build the application
COPY src ./src
RUN mvn clean package -DskipTests
RUN mvn clean install

# Run stage
FROM tomcat:8.5-jre8

# Copy the WAR file to the webapps directory of Tomcat
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose the port that Tomcat will run on
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]