FROM golang:latest

RUN apt-get update
RUN apt-get install -y build-essential

WORKDIR /app
COPY . .
RUN rm -rf /app/bin/
RUN make release-server
ENTRYPOINT "/go/bin/ngrokd"