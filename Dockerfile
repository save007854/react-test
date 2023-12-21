# Use an official Node.js runtime as a parent image
FROM node:14-alpine as build

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install npm dependencies
RUN npm install

# Copy the current directory contents to the container at /app
COPY . .

# Build the React app
RUN npm run build

# Use Nginx as a lightweight, efficient web server to serve the React app
FROM nginx:alpine

# Copy the build files from the build stage to the nginx public directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
