# pulu-sandbox
Pulu Sandbox Docker image

## Usage example
```bash
# Building sandbox
export PULU_PR="pr-7"
export PULU_IMAGE="ghcr.io/vives-projectwerk-2021/pulu-frontend:pr-7"

pulu exec staging " \
    docker run -t --name pulu-frontend.$PULU_PR --privileged \
    -v /devops/.ssh/id_rsa:/root/.ssh/id_rsa \
    -v /devops/deployment/staging/.env:/pulu.env \
    -p 5555:8080 \
    -e PULU_FRONTEND="$PULU_IMAGE" \
    ghcr.io/vives-projectwerk-2021/pulu-sandbox \
    make production" | cat

# Starting sandbox
docker start -a pulu-frontend.$PULU_PR
```