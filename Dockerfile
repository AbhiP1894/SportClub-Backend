# FROM build AS vulnscan
# COPY --from=aquasec/trivy:latest /usr/local/bin/trivy /usr/local/bin/trivy
# RUN trivy rootfs --no-progress /

FROM eclipse-temurin:17
LABEL mentainer="javaguides.net@gmail.com"
WORKDIR /app
COPY target/deccan-sport-club-1.1.jar /app/deccan-sport-club-1.1.jar
ENTRYPOINT ["java", "-jar", "deccan-sport-club-1.1.jar"]
# FROM adoptopenjdk/openjdk11:alpine-slim as build
# WORKDIR /workspace/app
# COPY mvnw .
# COPY .mvn .mvn
# COPY pom.xml .
# COPY src src
# RUN ./mvnw install -DskipTests
# RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)
# # Run vulnerability scan on build image


# FROM adoptopenjdk/openjdk11:alpine-slim
# VOLUME /tmp
# ARG DEPENDENCY=/workspace/app/target/dependency
# COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
# COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
# COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app
# ENTRYPOINT ["java", "-jar", "deccan-sport-club-1.1.jar"]
