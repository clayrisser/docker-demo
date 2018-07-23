FROM demo

RUN apk add --no-cache tini \
    node \
    bash \
    python

COPY ./package.json ./

RUN npm install

COPY ./ /

ENV NODE_ENV=development

ENTRYPOINT ["/sbin/tini", "--", "node", "demo.js"]
