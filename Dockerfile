# Use the Node.js 18 LTS image as the base
FROM node:18

# Set the working directory inside the container
WORKDIR /src

# Copy package.json and package-lock.json for dependency installation
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application source code
COPY . .

# Build the React application
RUN npm run build

# Expose the port Vite's preview server will run on
EXPOSE 5173

# Command to start the Vite preview server
CMD ["npm", "run", "preview"]
