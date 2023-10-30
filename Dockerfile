FROM node:slim
WORKDIR app
COPY . .
RUN npm install
RUN npm run test
RUN npm i -g express
EXPOSE 8000
CMD ["node","app.js"]
