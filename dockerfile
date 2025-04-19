# Use official Node.js base image
FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy rest of the app
COPY . .

# Expose port and run
EXPOSE 3000
CMD ["node", "index.js"]
