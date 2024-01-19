FROM maven:3.5.4-jdk-8-alpine as maven

COPY ./Backend/Iterazione3/project/pom.xml ./pom.xml

COPY ./Backend/Iterazione3/project/src ./src

RUN mvn dependency:go-offline -B

RUN mvn package

FROM openjdk:8u171-jre-alpine

WORKDIR .

COPY --from=maven target/demo-0.0.1-SNAPSHOT.jar ./demo.jar

EXPOSE 8080

CMD ["java", "-jar", "-Dspring.profiles.active=dev", "./demo.jar"]
