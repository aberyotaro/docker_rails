FROM ruby:2.6.0
 RUN apt-get update -qq && apt-get install -y build-essential libxslt-dev libxml2-dev cmake
 RUN apt-get install -y nodejs npm && npm install n -g && n 9.2.0
 RUN mkdir /app
 WORKDIR /app
 COPY ./src/Gemfile /app/Gemfile
 COPY ./src/Gemfile.lock /app/Gemfile.lock
 RUN bundle install
 COPY ./src /app
