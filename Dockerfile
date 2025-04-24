# Use official Node.js base image (lightweight)
FROM node:lts-alpine AS builder

# Set working directory inside container
WORKDIR /app

# Install only package.json first (leverages Docker layer cache)
COPY package*.json ./
RUN npm install

# Copy the rest of the app source code
COPY . .

RUN npm run build

FROM nginx
COPY --from=builder /app/dist /usr/share/nginx/html