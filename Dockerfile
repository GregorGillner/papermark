# DER FINALE DOCKERFILE

# 1. Update auf die korrekte Node.js Version
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package.json and lock file
COPY package*.json ./

# Copy the Prisma-Ordner
COPY prisma ./prisma

# 2. Installiere ALLE Abhängigkeiten mit dem '--legacy-peer-deps' Flag,
# um Konflikte zu beheben.
RUN npm ci --legacy-peer-deps

# Copy the rest of the application files
COPY . .

# 3. Führe den Build-Prozess mit einer expliziten Speichererhöhung auf 4GB aus,
# um einen "Silent Crash" durch zu wenig RAM zu verhindern.
RUN NODE_OPTIONS=--max-old-space-size=4096 npm run build

# Expose the port the app runs on
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
