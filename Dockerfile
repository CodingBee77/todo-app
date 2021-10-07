# FROM node:lts-alpine

# WORKDIR /app

# COPY package*.json ./

# RUN npm install

# COPY . .

# EXPOSE 8080

# RUN npm run serve


# base image
FROM node:14.18.0-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /app/package.json
RUN npm install
RUN npm install -g @vue/cli@4.5.13

# start app
CMD ["npm", "run", "serve"]
