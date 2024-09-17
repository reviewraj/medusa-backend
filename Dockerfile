# syntax=docker/dockerfile:1

# Stage 1: Build Stage
FROM node:20.14.0-alpine 

WORKDIR /app

# Copy package.json and package-lock.json to leverage Docker's caching
COPY package.json package-lock.json ./

# Install dependencies and Medusa CLI globally
RUN npm install && npm install -g @medusajs/medusa-cli@latest

# Copy the rest of the application code
COPY . .


EXPOSE 9000

CMD ["npm", "start"]
