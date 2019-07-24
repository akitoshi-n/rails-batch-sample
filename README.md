# rails-batch-sample
railsのバッチ処理のサンプル

## Setup for local
1. Install docker

2. Build docker container and start
```
$ docker-compose up
```

3. Start cron
```
$ docker-compose exec web bash
xxx:/# /etc/init.d/cron start
```

## Notice
Heroku does'nt support linux cron.
