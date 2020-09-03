# Multi-stage build

# Builder stage
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Runner stage
FROM nginx

# Required for AWS EBS to map port for incoming traffic
EXPOSE 80

# /usr/share/nginx/html comes from the ngnix docs
# --from=0 refers to the unnamed builder stage
COPY --from=0 /app/build /usr/share/nginx/html
# No CMD necessary b/c the nginx image starts the server