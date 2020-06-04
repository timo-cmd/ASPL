FROM node:14

RUN mkdir -p aspl
ENV aspl_ROOT=aspl

WORKDIR aspl

ADD . ./

RUN npm install .
