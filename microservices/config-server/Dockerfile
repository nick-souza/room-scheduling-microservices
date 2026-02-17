# ---------- BUILD STAGE ----------
FROM maven:3.9.2-eclipse-temurin-17 AS build

WORKDIR /app

COPY . .

# RUN mvn -pl config-server -am clean package -DskipTests
RUN mvn -pl config-server -am clean package -DskipTests spring-boot:repackage

# ---------- RUN STAGE ----------
FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

COPY --from=build /app/config-server/target/config-server-*.jar app.jar

EXPOSE 9090

ENTRYPOINT ["java","-jar","app.jar"]