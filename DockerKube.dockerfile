# Use the Alpine Linux image as the base
FROM alpine:latest

# Set the working directory to server
WORKDIR /server

COPY ./server .

# Install npm and node
RUN apk add --update npm nodejs

# Run npm install to install dependencies
RUN npm i

# Run npm run build to build the project
RUN npm run build

# Echo the docker variable PORT to .env file
RUN echo "PORT=$PORT" > .env

EXPOSE 3000

# Run node ./index.js to start the server
CMD ["node", "./index.js"]