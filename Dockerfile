
# Build container

FROM node:lts-alpine as build

WORKDIR /build

ADD . .
RUN npm install


# Runtime container

FROM node:lts-alpine

WORKDIR /app

COPY --from=build /build/node_modules node_modules/
COPY --from=build /build/index.js .
COPY --from=build /build/soap/*.wsdl soap/
COPY --from=build /build/soap/*.xml soap/

CMD node index.js
