# Die goldene Dockerfile-Version

# 1. Update auf eine neuere Node.js Version
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package.json and lock file
COPY package*.json ./

# Copy the Prisma-Ordner
COPY prisma ./prisma

# 2. Installiere ALLE Abhängigkeiten und nutze den '--legacy-peer-deps' Flag
RUN npm ci --legacy-peer-deps

# Copy application files
COPY . .

# Build the application
RUN npm run build

# Expose the port the app runs on
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
