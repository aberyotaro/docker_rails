# 前提
rbenvインストール済み

# 構築方法
- ruby 2.6.1
- Rails5.2.2

```
$ mkdir app_dir
$ cd app_dir
$ rbenv local 2.6.1
$ rails _5.2.2_ new app_name
# app_nameに、.env, Dockerfile, docker-compose.ymlを配置
$ docker-compose --build
$ docker-compose up
```

sqlite3周りのエラーが起きた場合、下記参照

[Railsを始めてsqlite3まわりのエラーで躓いている人たちへ](https://qiita.com/Kta-M/items/254a1ba141827a989cb7)

```
Puma caught this error: Error loading the 'sqlite3' Active Record adapter. Missing a gem it depends on? can't activate sqlite3 (~> 1.3.6), already activated sqlite3-1.4.0. Make sure all dependencies are added to Gemfile. (LoadError)
```
