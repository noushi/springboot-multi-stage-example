FROM mcr.microsoft.com/java/maven:11-zulu-debian10 as builder

COPY gs-spring-boot/initial /src

RUN cd /src && \
    mvn compile package


FROM mcr.microsoft.com/java/jre-headless:11-zulu-debian10

ENV TARGET=gs-spring-boot-0.1.0.jar

COPY --from=builder /src/target/$TARGET  /opt

EXPOSE 8080

CMD exec java -jar /opt/$TARGET
