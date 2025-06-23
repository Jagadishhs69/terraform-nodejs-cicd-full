FROM node:18-alpine
WORKDIR /app
COPY app/ .
RUN npm install
CMD ["node", "server.js"]
EXPOSE 80