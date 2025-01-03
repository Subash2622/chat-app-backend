# Stage 1: Build stage
FROM maven:3.9.4-eclipse-temurin-21-alpine AS build
COPY . . 
RUN mvn clean package -DskipTests

# Stage 2: Run stage
FROM openjdk:21-jdk-slim
COPY --from=build /target/chat-app-backend-0.0.1-SNAPSHOT.jar chat-app-backend.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "chat-app-backend.jar"]
