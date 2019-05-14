# Build steps

FROM node:alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# Run steps

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
