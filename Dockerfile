FROM nginx:1.17-alpine 

# node build file
COPY build /usr/share/nginx/html

# run nginx as foreground process
CMD ["nginx", "-g", "daemon off;"]
