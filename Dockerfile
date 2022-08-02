FROM ruby:3.1.0

RUN apt-get update -qq && \ 
  apt-get install -y build-essential \
  nodejs \
  mariadb-server \
  mariadb-client

WORKDIR /daijobso

COPY Gemfile /daijobso/Gemfile
COPY Gemfile.lock /daijobso/Gemfile.lock

RUN gem install bundler
RUN bundle install

RUN mkdir -p tmp/sockets