FROM golang:1.24.2-alpine

WORKDIR /code
COPY . .

WORKDIR /code/src

RUN go mod tidy

ENV GOOS=windows

ENV GOARCH=arm64
RUN go build -o uspy_arm64.exe main.go

ENV GOARCH=arm
RUN go build -o uspy_arm.exe main.go

ENV GOARCH=amd64
RUN go build -o uspy_amd64.exe main.go

ENV GOARCH=386
RUN go build -o uspy_386.exe main.go

WORKDIR /code/out
RUN mv /code/src/uspy_arm64.exe .
RUN mv /code/src/uspy_arm.exe .
RUN mv /code/src/uspy_amd64.exe .
RUN mv /code/src/uspy_386.exe .

CMD [ "sh" ]