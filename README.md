# ofsted-stub

Stub representing the Ofsted web service.

Based on github.com/officer-rosmarino/node-soap-example.git

Note that `SOAP_URL` will need to be passed through. It is set to http://ofstedstub:3000 so this can be used locally.

# Setup

```sh
docker network create ofsted_network
```

# Run the api

```sh
docker build --build-arg SOAP_URL=http://ofstedstub:3000 --pull --rm -f "Dockerfile" -t ofstedstub:latest . && \
docker run --name ofstedstub -d -p 127.0.0.1:5000:3000 --network ofsted_network ofstedstub:latest
```

# Run the client

```sh
docker build --pull --rm --progress=plain --no-cache -f "Dockerfile.client" -t ofstedclient:latest . && \
docker run -e SOAP_URL=http://ofstedstub:3000 --name ofstedclient -it --rm -p 127.0.0.1:3001:3000 --network ofsted_network ofstedclient:latest
```

# Node

There is an nvmrc file but its not really needed here, but this was originally created and running on these node versions!

Resolving node version 12.x...
Downloading and installing node 12.19.0...
Using default npm version: 6.14.8
