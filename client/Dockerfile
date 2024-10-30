# Use Node.js image to build the React app
FROM node:18 as build

# Create a working directory inside the container
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy all frontend code and build it
COPY . .
RUN npm run build
RUN npm audit fix

# Use Nginx to serve the React frontend
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html

# Expose the Nginx default port
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]

