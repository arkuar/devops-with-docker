FROM node:14

EXPOSE 5000

WORKDIR /app

COPY . .

RUN npm install

RUN npm run build

CMD [ "npm", "run", "start-prod" ]