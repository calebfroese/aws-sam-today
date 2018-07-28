FROM node:10

ARG username
ARG password
ENV GITHUB_USR $username
ENV GITHUB_PWD $password

RUN git config --global user.email "caleb.froese@gmail.com"
RUN git config --global user.name $username

RUN npm i -g @angular/cli

COPY ./commit.sh ./commit.sh

CMD sh ./commit.sh