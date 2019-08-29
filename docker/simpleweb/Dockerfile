#Specify a base image

FROM node:alpine

#Ensure there is 
WORKDIR /usr/app

COPY ./package.json ./

#Install some dependencies
RUN npm install

#Copy everything else
COPY ./ ./

#Default command
CMD ["npm","start"]

#docker build -t aish/simpleweb .
#docker run -p 8080:8080 aish/simpleweb
