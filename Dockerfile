# Use an official OpenJDK image to run Java
FROM openjdk:17-jdk-slim

# Set working directory inside the container
WORKDIR /app

# Copy the Java source file into the container
COPY test.java /app/

# Compile the Java program
RUN javac test.java

# Run the application
CMD ["java", "test"]