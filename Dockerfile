# build
FROM node:latest AS builder

WORKDIR /app

COPY package*.json ./ 

RUN npm install

COPY . .

RUN npm run build

# run
FROM nginx:1.17-alpine 

WORKDIR /usr/share/nginx/html

# node build file
COPY --from=builder /app/build/ .

# run nginx as foreground process
CMD ["nginx", "-g", "daemon off;"]
