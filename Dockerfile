FROM node:alpine as reactapp
WORKDIR /app
COPY ./package.json /app
COPY . /app
ENTRYPOINT ["npm","start"]



#nginx
FROM nginx:1.23.4-alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=reactapp /app/build/ .
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]