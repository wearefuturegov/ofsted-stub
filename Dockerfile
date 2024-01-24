
# Build container

FROM node:lts-alpine as build

WORKDIR /build

ADD . .
RUN npm install


# Runtime container

FROM node:lts-alpine

# commenting out for now but if we end up needing to set the variable on build hhis will do the trick
# add this to your docker build for outpost-stub too:
# --build-arg SOAP_URL=http://ofsted-stub:3000 
#
# ARG SOAP_URL
# ENV SOAP_URL=$SOAP_URL

WORKDIR /app

COPY --from=build /build/node_modules node_modules/
COPY --from=build /build/index.sh .
COPY --from=build /build/index.js .
COPY --from=build /build/soap/*.wsdl soap/
COPY --from=build /build/soap/*.xml soap/

# RUN sed -i "s#{{SOAP_URL}}#$SOAP_URL#g" soap/WebExtractServices.wsdl

RUN chmod +x ./index.sh
CMD ./index.sh



