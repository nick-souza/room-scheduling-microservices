# ---------- BUILD STAGE ----------
FROM maven:3.9.2-eclipse-temurin-17 AS build
WORKDIR /app

COPY . .

RUN mvn -pl authentication -am clean package -DskipTests spring-boot:repackage

# ---------- RUN STAGE ----------
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app

COPY --from=build /app/authentication/target/authentication-*.jar app.jar

EXPOSE 9099
ENTRYPOINT ["java","-jar","app.jar"]