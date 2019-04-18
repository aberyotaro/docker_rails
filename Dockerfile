FROM ruby:2.4.0

# シェルスクリプトとしてbashを利用
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# 必要なライブラリインストール
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# yarnパッケージ管理ツールインストール
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

# Node.jsをインストール
RUN apt-get update && apt-get install -y nodejs npm
# n packageインストールして、ver.9.2.0をインストール
RUN npm install n -g && n 9.2.0

# npmをインストール
RUN apt-get update -qq && apt-get install -y npm

# その他
RUN apt-get update -qq && apt-get install -y cmake

RUN mkdir /app

WORKDIR /app

COPY src/Gemfile /app/Gemfile
COPY src/Gemfile.lock /app/Gemfile.lock

RUN bundle install
RUN gem install ruby-debug-ide

COPY src /app
