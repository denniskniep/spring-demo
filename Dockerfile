#--------------Build-Container------------------
FROM maven:3.6.0-jdk-8-alpine AS build

COPY ./ /app/

WORKDIR /app

RUN mvn clean install

#--------------Execution-Container---------------
FROM openjdk:8-jre-slim

COPY --from=build /app/target/spring-demo.jar /app/spring-demo.jar

WORKDIR /app

EXPOSE 8080

ENTRYPOINT ["java", "-Xms1g", "-Xmx2g", "-XX:+UnlockExperimentalVMOptions","-XX:+UseCGroupMemoryLimitForHeap", "-Duser.timezone=UTC", "-jar", "/app/spring-demo.jar"]
CMD [""]
