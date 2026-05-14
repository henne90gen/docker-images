FROM henne90gen/forgejo-runner-image:latest

RUN java -version

COPY gradle-test /gradle-test
WORKDIR /gradle-test
RUN ./gradlew run

RUN go version

COPY go-test /go-test
WORKDIR /go-test
RUN go run main.go
