FROM ruby:2.6.1
RUN apt-get update -qq && apt-get install -y build-essential nodejs cmake
RUN mkdir /app
WORKDIR /app
COPY ./src/Gemfile /app/Gemfile
COPY ./src/Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app
