# Stage 1: Build the app
FROM node:23.11.0-alpine-slim AS builder

# Set working directory
WORKDIR /app

# Copy dependency definitions first for layer caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy app source
COPY . .

# Build the production version of the app
RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:stable-alpine

# Remove default nginx static content
RUN rm -rf /usr/share/nginx/html/*

# Expose port (optional - for documentation)
EXPOSE 80

# Copy built assets from builder stage
COPY --from=builder /app/dist /usr/share/nginx/html