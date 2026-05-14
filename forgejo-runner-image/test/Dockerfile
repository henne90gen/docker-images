FROM henne90gen/forgejo-runner-image:latest

# Gradle Test
RUN java -version
COPY gradle-test /gradle-test
WORKDIR /gradle-test
RUN ./gradlew run

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
