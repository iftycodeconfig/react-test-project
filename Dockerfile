# Use the Node.js 18 LTS image as the base
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json for dependency installation
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application source code
COPY . .

# Build the React application
RUN npm run build

# Use a lightweight server to serve the build (e.g., Vite's preview or `serve`)
RUN npm install -g serve

# Expose the port Vite's preview server or `serve` will use
EXPOSE 4173

# Start the server to serve the production build
CMD ["serve", "-s", "dist", "-l", "4173"]
