# Use an existing docker image as a base
# FROM node:alpine 
FROM node:alpine as builder

# Set working directory
WORKDIR "/usr/app"

# Copy files into container and install dependencies
COPY package.json .
RUN npm install
COPY . .

# Tell the image what to do when it starts as a container
RUN npm run build

FROM nginx
EXPOSE 80
# COPY --from=0 /usr/app/build /usr/share/nginx/html 
COPY --from=builder /usr/app/build /usr/share/nginx/html

