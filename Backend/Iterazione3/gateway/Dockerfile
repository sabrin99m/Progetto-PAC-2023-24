# syntax=docker/dockerfile:1

ARG NODE_VERSION=21.2.0
FROM node:${NODE_VERSION}-alpine
ENV NODE_ENV production
WORKDIR /usr/src/app
RUN --mount=type=bind,source=./Backend/Iterazione3/gateway/package.json,target=package.json \
    --mount=type=bind,source=./Backend/Iterazione3/gateway/package-lock.json,target=package-lock.json \
    --mount=type=cache,target=/root/.npm \
    npm ci --omit=dev

USER node

COPY . .

EXPOSE 8085

CMD npm start
