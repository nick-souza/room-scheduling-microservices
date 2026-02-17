# ---------- BUILD STAGE ----------
FROM maven:3.9.2-eclipse-temurin-17 AS build

WORKDIR /app

COPY . .

RUN mvn -pl eureka-server -am clean package -DskipTests

# ---------- RUN STAGE ----------
FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

COPY --from=build /app/eureka-server/target/eureka-server-*.jar app.jar

EXPOSE 8761

ENTRYPOINT ["java","-jar","app.jar"]
