FROM ruby:2.4-stretch

ENV LANG C.UTF-8
ENV ROOT_PATH /app

RUN mkdir $ROOT_PATH
WORKDIR $ROOT_PATH
COPY src/Gemfile $ROOT_PATH/Gemfile
COPY src/Gemfile.lock $ROOT_PATH/Gemfile.lock

# 必要なライブラリインストール
RUN apt-get update -qq && apt-get install -y \
    sudo \
    build-essential \
    libpq-dev \
    cmake \
    yarn && \
    # Node.jsをインストール
    curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash - && \
    apt-get install -y nodejs npm && \
    # n packageインストールして、ver.9.2.0をインストール
    npm install n -g && \
    n 9.2.0 && \
    bundle install

COPY src $ROOT_PATH
