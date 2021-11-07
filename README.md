# pulu-sandbox
Pulu Sandbox Docker image

## Usage example
```bash
# Building sandbox
export PULU_PR="pulu-frontend.pr-7"

docker run -t --name $PULU_PR --privileged \
  -v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
  -v $(pwd)/production/.env:/pulu.env \
  -p 8080:8080 \
  -e PULU_FRONTEND="ghcr.io/vives-projectwerk-2021/pulu-frontend:pr-7" \
  ghcr.io/vives-projectwerk-2021/pulu-sandbox \
  make production

# Starting sandbox
docker start -a $PULU_PR
```