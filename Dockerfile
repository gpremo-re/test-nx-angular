FROM node:21.6-alpine as BUILD

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

COPY nx.json project.json tsconfig.app.json tsconfig.base.json tsconfig.json ./
COPY public public
COPY libs libs
COPY src src

RUN --mount=type=cache,target=/app/.nx/cache npm run build

FROM scratch
COPY --from=BUILD /app/dist/test-nx-angular/browser/ build
