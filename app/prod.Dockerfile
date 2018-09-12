# Build stage
# Installs the current application on a Node Image.
FROM node:8.11 as build-stage
# The qq is for silent output in the console
# You are welcome to modify this part as it
RUN apt-get update && apt-get install -y build-essential libpq-dev vim
# Sets the path where the app is going to be installed
ENV NODE_ROOT /usr/app/
# Creates the directory and all the parents (if they don’t exist)
RUN mkdir -p $NODE_ROOT
# Sets the /usr/app as the active directory
WORKDIR $NODE_ROOT
# Copies all the content
COPY . .
# Install all the packages
RUN npm install -g @angular/cli
# RUN npm install
RUN yarn install
# Uncomment this if you went with Option #2 in Step #2 (Windows Only)
# RUN npm rebuild node-sass --force
# The default port from ng serve (4200)
# and 49153 for Webpack Hot Module Reload

# Remove old file
# RUN rm -r dist

RUN yarn run build 

# Deploy stage
FROM nginx:1.13.12-alpine as production-stage

# Copy the build production directory from build-stage into nginx/vuejs_nginx
COPY --from=build-stage /usr/app/dist /usr/share/nginx/angular_nginx

# Copy the nginx config file into nginx system
COPY ./angular_nginx.conf /etc/nginx/conf.d