# Use an existing docker image as a base
FROM node:alpine as builder

# Set working directory
WORKDIR "/app"

# Copy files into container and install dependencies
COPY ./package.json ./
RUN npm install
COPY . .

# Tell the image what to do when it starts as a container
RUN npm run build

FROM nginx
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html


