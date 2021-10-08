FROM node:latest

ENV HELPER_SCRIPTS_FOLDER=/usr/share/scripts
ENV REACT_WEB_PATH=/var/www/frontend/

WORKDIR ${SYMFONY_WEB_PATH}

RUN mkdir -p -v ${HELPER_SCRIPTS_FOLDER}
COPY initReactProject.sh /usr/share/scripts

RUN echo ${REACT_WEB_PATH} > ${HELPER_SCRIPTS_FOLDER}/reactWebPath.txt
## add `/app/node_modules/.bin` to $PATH
#ENV PATH /var/www/react/node_modules/.bin:$PATH

RUN npm install npx -g --force
RUN npm install npm -g --force
RUN npm install -g create-react-app
RUN npm cache clean --force

EXPOSE 3000