FROM node:20-slim AS base
ENV HUSKY=0
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable
WORKDIR /app

FROM base as build-base
COPY . /app

FROM build-base AS prod-deps
RUN --mount=type=cache,id=pnpm,target=/pnpm/store NODE_ENV=production pnpm install --prod --frozen-lockfile

FROM build-base AS build
RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --frozen-lockfile
RUN pnpm run build

FROM base
ENV NODE_ENV=production
COPY --from=prod-deps /app/node_modules /app/node_modules
COPY --from=build /app/dist /app/dist
COPY package.json .
COPY pnpm-lock.yaml .
EXPOSE 8000
CMD [ "pnpm", "start" ]