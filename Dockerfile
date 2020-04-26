# use latest Node LTS (alpine)
FROM node:lts-alpine

# set user to avoid permission issues
# (see https://github.com/nodejs/node-gyp/issues/1236)
USER node
RUN mkdir /home/node/.npm-global
ENV PATH=/home/node/.npm-global/bin:$PATH
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

# install surge CLI
RUN npm install -g surge && \
    npm cache clean --force

# reset user back to root
USER root
