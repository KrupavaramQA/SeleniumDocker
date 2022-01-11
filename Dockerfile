FROM openjdk:8u191-jre-alpine3.8
RUN apk add curl jq
WORKDIR /user/share/execution
ADD target/selenium-docker.jar selenium-docker.jar
ADD target/selenium-docker-tests.jar selenium-docker-tests.jar
ADD target/libs libs
ADD target/test-classes test-classes
ADD testng.xml testng.xml
ADD healthcheck.sh healthcheck.sh
ENTRYPOINT sh healthcheck.sh