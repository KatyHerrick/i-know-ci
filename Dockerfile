# Multi-stage build

# Build stage
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run stage
FROM nginx

# Required for AWS EBS to map port for incoming traffic
EXPOSE 80

# /usr/share/nginx/html comes from the ngnix docs
COPY --from=builder /app/build /usr/share/nginx/html
# No CMD necessary b/c the nginx image starts the server