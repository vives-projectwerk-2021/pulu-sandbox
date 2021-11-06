FROM alpine:3.13.6

RUN apk update
RUN apk add curl libc6-compat openssh

RUN curl -L https://github.com/vives-projectwerk-2021/pulu-cli/releases/latest/download/pulu-linux -o /bin/pulu
RUN chmod +x /bin/pulu

VOLUME [ "/root/.ssh/id_rsa" ]

ENTRYPOINT [ "sh", "-c" ]