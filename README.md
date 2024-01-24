# ofsted-stub

Stub representing the Ofsted web service.

Based on github.com/officer-rosmarino/node-soap-example.git

Note that `SOAP_URL` will need to be passed through. It is set to http://ofsted-stub:3000 so this can be used locally.

@TODO setting the SOAP_URL in `soap/WebExtractServices.wsdl` - there should be a better option

# Setup

```sh
docker network create ofsted_network
```

# Run the api

```sh
docker build --pull --rm -f "Dockerfile" -t ofsted-stub:latest . && \
docker run -e SOAP_URL=http://ofsted-stub:3000 --name ofsted-stub -d -p 127.0.0.1:5000:3000 --network ofsted_network ofsted-stub:latest
```

# Run the client

```sh
docker build --pull --rm -f "Dockerfile.client" -t ofsted-client:latest . && \
docker run -e SOAP_URL=http://ofsted-stub:3000 --name ofsted-client -it --rm -p 127.0.0.1:3001:3000 --network ofsted_network ofsted-client:latest
```

# Node

There is an nvmrc file but its not really needed here, but this was originally created and running on these node versions!

Resolving node version 12.x...
Downloading and installing node 12.19.0...
Using default npm version: 6.14.8

# Setting up on GCP

## Initial setup (for reference only)

1. [Create a project in google cloud](https://console.cloud.google.com/)
2. Take note of the project id `PROJECT_ID=outpost-ofsted-feed`
3. Go into IAM and Admin and select service accounts. [link](https://console.cloud.google.com/iam-admin/serviceaccounts?project=outpost-ofsted-feed)

   Click + Create service account
   service account name: `ofsted-stub-deploy`
   service account description: `Github actions deployment account for ofsted-stub repo`
   Click continue
   Grant `Owner` permissions
   Click continue
   Click done

   Click into the `ofsted-stub-deploy` account and go to keys > add key - create new key, choose json
   Run `cat myproject-7fdd5b1966dc.json | base64 > deploy-key.txt` this is your `GOOGLE_APPLICATION_CREDENTIALS` value

4. Add `PROJECT_ID` and `GOOGLE_APPLICATION_CREDENTIALS` as [repository secrets](https://github.com/wearefuturegov/ofsted-stub/settings/secrets/actions) in github
