FROM node:latest

ENV HELPER_SCRIPTS_PATH=/usr/share/scripts

WORKDIR /var/www/frontend

RUN mkdir -p -v ${HELPER_SCRIPTS_PATH}
COPY initReactProject.sh /usr/share/scripts
## add `/app/node_modules/.bin` to $PATH
#ENV PATH /var/www/react/node_modules/.bin:$PATH

RUN npm install npx -g --force
RUN npm install npm -g --force
RUN npm install -g create-react-app
RUN npm cache clean --force

EXPOSE 3000