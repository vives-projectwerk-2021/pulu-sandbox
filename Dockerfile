FROM jpetazzo/dind

RUN apt-get update && apt-get install -y \
    curl \
    git \
    make
    
RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

RUN mkdir -p ~/.ssh
RUN ssh-keyscan github.com >> ~/.ssh/known_hosts

RUN curl -L https://github.com/vives-projectwerk-2021/pulu-cli/releases/latest/download/pulu-linux -o /bin/pulu
RUN chmod +x /bin/pulu

VOLUME [ "~/.ssh/id_rsa" ]

COPY ./entrypoint.sh .
RUN chmod +x entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]