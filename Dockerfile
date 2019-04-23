FROM ruby:2.4-stretch

ENV LANG C.UTF-8
ENV ROOT_PATH /app

RUN mkdir $ROOT_PATH
WORKDIR $ROOT_PATH
COPY src/Gemfile $ROOT_PATH/Gemfile
COPY src/Gemfile.lock $ROOT_PATH/Gemfile.lock

# 必要なライブラリインストール
RUN apt-get update -qq && apt-get install -y \
    bash \
    sudo build-essential \
    libpq-dev \
    cmake \
    curl \
    apt-transport-https \
    wget && \

    # yarn
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn && \

    # Node.jsをインストール
    curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash - && \
    apt-get install -y nodejs npm && \

    # n packageインストールして、ver.9.2.0をインストール
    npm install n -g && n 9.2.0

RUN bundle install
RUN gem install ruby-debug-ide

COPY src $ROOT_PATH
