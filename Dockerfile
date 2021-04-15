# build environment
FROM node:13.12.0-alpine as build
WORKDIR /app
COPY . .
RUN npm i && npm run build

# production environment
FROM nginx:1.16.0-alpine

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]