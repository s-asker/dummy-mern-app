# Use Node.js image from DockerHub
FROM node:18

# Create a working directory inside the container
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json package-lock.json ./
RUN npm install
RUN npm audit fix

# Copy all backend code into the container
COPY . .

# Expose the port your backend runs on (3000)
EXPOSE 3000

# Start the backend server
CMD ["npm", "start"]

