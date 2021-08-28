# Use an existing docker image as a base
FROM node:14.14.0-alpine

# Set working directory
WORKDIR "/app"

# Copy files into container and install dependencies
COPY ./package.json ./
RUN npm install
COPY . .

# Tell the image what to do when it starts as a container
CMD [ "npm", "run", "start" ]