FROM alpine:latest

ENV HELPER_SCRIPTS_FOLDER=/usr/share/scripts
ENV REACT_WEB_PATH=/var/www/frontend/

WORKDIR ${REACT_WEB_PATH}

RUN mkdir -p -v ${HELPER_SCRIPTS_FOLDER}
COPY initReactProject.sh /usr/share/scripts

## add `/app/node_modules/.bin` to $PATH
#ENV PATH /var/www/react/node_modules/.bin:$PATH
RUN apk add --update nodejs npm
RUN npm install npx -g --force
RUN npm install npm -g --force

# RUN npm install -g react-scripts
RUN npm install -g create-react-app
RUN npm cache clean --force

EXPOSE 3000
