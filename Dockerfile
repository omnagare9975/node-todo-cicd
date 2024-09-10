# Use the smallest Node.js base image (Alpine version)
FROM node:12-alpine

# Set the working directory inside the container
WORKDIR /node

# Copy only package.json and package-lock.json (for better build caching)
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy the rest of the application code
COPY . .

# Expose port 8000 to the host
EXPOSE 8000

# Start the application
CMD ["node", "app.js"]
