FROM eclipse-temurin:21-jre
COPY target/my-app-1.0-SNAPSHOT.jar app.jar
CMD ["java", "-jar", "app.jar"]