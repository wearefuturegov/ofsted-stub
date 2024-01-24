
# Build container

FROM node:lts-alpine as build

WORKDIR /build

ADD . .
RUN npm install


# Runtime container

FROM node:lts-alpine

ARG SOAP_URL
ENV SOAP_URL=$SOAP_URL

WORKDIR /app

COPY --from=build /build/node_modules node_modules/
COPY --from=build /build/index.js .
COPY --from=build /build/soap/*.wsdl soap/
COPY --from=build /build/soap/*.xml soap/

RUN sed -i "s#{{SOAP_URL}}#$SOAP_URL#g" soap/WebExtractServices.wsdl

CMD node index.js
