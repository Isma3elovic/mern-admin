# Use Node.js v18 as the base image
FROM node:18

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if they exist) to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire Angular project (including angular.json, src, etc.)
COPY . .

# Build the Angular project
RUN npm run build

# Expose the port your app will run on
EXPOSE 4000

# Command to run your app (adjust this based on your app's entry point)
CMD ["node", "server.mjs"]
