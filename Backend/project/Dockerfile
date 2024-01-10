FROM maven:3-eclipse-temurin-8 AS build
WORKDIR /build
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY . .
RUN mvn package
FROM eclipse-temurin:8-alpine
COPY --from=build build/target/demo-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]