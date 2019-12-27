# Step 1 : build for production
FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Step 2 : copy build files in nginx image
FROM nginx
# copy builder /app/build files from previous step to the nginx image
COPY --from=builder /app/build /usr/share/nginx/html