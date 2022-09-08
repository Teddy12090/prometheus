FROM gradle:7.5-jdk11 AS build

COPY ["gradle/", "settings.gradle.kts", "build.gradle.kts", "/home/gradle/src/"]

WORKDIR /home/gradle/src

RUN gradle dependencies

COPY --chown=gradle:gradle . /home/gradle/src

RUN gradle build

FROM openjdk:11

COPY --from=build /home/gradle/src/build/libs/prometheus-0.0.1-SNAPSHOT.jar /usr/prometheus-0.0.1-SNAPSHOT.jar

ENTRYPOINT java -jar /usr/prometheus-0.0.1-SNAPSHOT.jar

EXPOSE 8080