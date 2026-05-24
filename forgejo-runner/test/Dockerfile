FROM henne90gen/forgejo-runner:latest

RUN just --version
RUN git version

# Gradle Test
RUN java -version
COPY gradle-test /gradle-test
WORKDIR /gradle-test
RUN chmod +x ./gradlew
RUN ./gradlew --version
RUN ./gradlew run
RUN gradle --version
RUN gradle run
RUN sdkmanager --version

# Go Test
RUN go version
COPY go-test /go-test
WORKDIR /go-test
RUN go run main.go

# Node.js Test
RUN node --version && yarn --version
COPY frontend-test /frontend-test
WORKDIR /frontend-test
RUN yarn install --frozen-lockfile
RUN yarn build
