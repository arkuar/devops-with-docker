FROM node:14-alpine as build

WORKDIR /app

COPY . .

RUN npm install && \
    npm run build && \
    npm prune --production

FROM node:14-alpine

EXPOSE 5000

WORKDIR /app

COPY --from=build /app/app.js /app/package.json ./

COPY --from=build /app/dist ./dist

COPY --from=build /app/node_modules ./node_modules

RUN adduser -D appuser

USER appuser

CMD [ "npm", "run", "start-prod" ]