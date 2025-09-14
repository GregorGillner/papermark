# DER FINALE DOCKERFILE

FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
COPY prisma ./prisma
RUN npm ci --legacy-peer-deps
COPY . .
RUN NODE_OPTIONS=--max-old-space-size=4096 npm run build
EXPOSE 3000
CMD ["npm", "start"]
