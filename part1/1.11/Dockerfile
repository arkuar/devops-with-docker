FROM openjdk:8

# Expose the port specified in README
EXPOSE 8080

# Copy project files
COPY . .

# Build project
RUN ./mvnw package

# Run
CMD [ "java", "-jar", "./target/docker-example-1.1.3.jar" ]