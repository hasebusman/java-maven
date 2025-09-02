# Stage 1: Build the JAR
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run the JAR
FROM eclipse-temurin:17-jre
WORKDIR /app
# Copy all jar files into /app
COPY --from=build /app/target/*.jar /app/

# Run the shaded JAR (update name if needed)
CMD ["java", "-jar", "/app/jb-hello-world-maven-0.2.0-shaded.jar"]
