# 前提
rbenvインストール済み

## 構築方法

### 要件
- ruby 2.6.1
- Rails5.2.2

### git clone

```
$ git clone https://github.com/ryotarooooabe/rails_docker.git
$ cd rails_docker
```

### Rubyバージョンを変更

```
$ rbenv local 2.6.1
$ rails _5.2.2_ new {APP_NAME}
```

### .env.exampleをコピーして.envを作成

```
$ cp .env.example .env
```

### Dockerfileのマッピングを{APP_NAME}に併せて編集

```
(略)

COPY ./app_name/Gemfile.lock /app/Gemfile.lock

```

### コンテナ起動

```
$ docker-compose --build
$ docker-compose up
```

### その他

sqlite3周りのエラーが起きた場合、下記参照

[Railsを始めてsqlite3まわりのエラーで躓いている人たちへ](https://qiita.com/Kta-M/items/254a1ba141827a989cb7)

> Puma caught this error: Error loading the 'sqlite3' Active Record adapter. Missing a gem it depends on? can't activate sqlite3 (~> 1.3.6), already activated sqlite3-1.4.0. Make sure all dependencies are added to Gemfile. (LoadError)
