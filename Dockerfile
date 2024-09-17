# syntax=docker/dockerfile:1

# Stage 1: Build Stage
FROM node:20.14.0-alpine AS build

WORKDIR /app

# Copy package.json and package-lock.json to leverage Docker's caching
COPY package.json package-lock.json ./

# Install dependencies and Medusa CLI globally
RUN npm install && npm install -g @medusajs/medusa-cli@latest

# Copy the rest of the application code
COPY . .

# Stage 2: Production Stage
FROM node:20.14.0-alpine

WORKDIR /app

# Install only the production dependencies and Medusa CLI globally
COPY --from=build /app/node_modules /app/node_modules
COPY --from=build /usr/local/bin/medusa /usr/local/bin/medusa
COPY --from=build /app .

# Set NODE_ENV to production for smaller image and optimized dependencies
ENV NODE_ENV=production

# Expose the port the application will run on
EXPOSE 7001
EXPOSE 9000

CMD ["npm", "start"]
