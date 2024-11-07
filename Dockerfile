# Etapa 1: Construção
FROM gradle:7.6.0-jdk17 AS builder
WORKDIR /app
COPY gradlejava17 .
RUN gradle clean build --stacktrace

# Etapa 2: Execução
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=builder /app/build/libs/*.jar application.jar

# Exposes the default HTTP port (change if necessary)
EXPOSE 8080

# Comando para rodar a aplicação
ENTRYPOINT ["java", "-jar", "application.jar"]
