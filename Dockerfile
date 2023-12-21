# Use an official Node.js image as a base image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json ./

ENV PATH //app/node_modules/.bin:$PATH

COPY . .

# Install dependencies
RUN npm install

# Expose the port on which the React app will run
EXPOSE 3000

# Define the command to run your React app
CMD ["npm", "start"]