# rails-batch-sample
railsのバッチ処理のサンプル

## Precondition
- Deploy to Heroku

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
Heroku doesn't support linux cron.

## methods
### crontab
もっとも一般的な方法。cronを簡単に扱えるように`whenever`というgemがある。しかし、Herokuでは使えない。

### lambda
LambdaからHeroku上のジョブを実行する。
運用が大変。

### heorku scheduler
ジョブを作成したら、HerokuのGUIから設定が可能。一番簡単な方法。
しかし、必ずしも実行される保証はない。

### custom clock process
(clockwork)[https://github.com/Rykian/clockwork/]というgemを使う方法。
