# Use an official Node.js runtime as a base image
FROM node:14

# Set the working directory in the container
WORKDIR /src/app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the local React app files to the container
COPY . .

# Build the React app
RUN npm run build

# Expose port 80 to the outside world
EXPOSE 80

# Command to run the application
CMD ["npm", "start"]
