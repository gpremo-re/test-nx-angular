FROM node:21.6-alpine as BUILD

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

COPY nx.json project.json tsconfig.app.json tsconfig.json ./
COPY public public
COPY src src

RUN --mount=type=cache,target=/app/.nx/cache npm run build --output-path=../build

FROM scratch
COPY --from=BUILD build build
