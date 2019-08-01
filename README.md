# rails-batch-sample
Investigation of batch processing infrastructure on Heroku

## Restriction
- Deploy to Heroku
- Use [delayed_job](https://github.com/collectiveidea/delayed_job) for queue system

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

## Methods
### Crontab
The most common method. There is also a gem [whenenver](https://github.com/javan/whenever) that can easily handle crontab. But Heroku doesn't support linux cron.

### AWS Lambda
Run a job on Heroku from Lambda. But operation is difficult.

### Heroku scheduler
Once you create a job, you can configure it from the Heroku GUI. The easiest method. However the problem is that you can not specify details, and there is no guarantee that it will be executed.

### Custom clock process
Use a gem [clockwork](https://github.com/Rykian/clockwork/).
This is a method of setting up one server for periodic execution.

## Conclusion
I decided to use custom clock process because it is recommended by Heroku, easy to schedule, and stable compared to Heroku scheduler. But If I could use [sidekiq](https://github.com/mperham/sidekiq) for queue system, I would select [simple scheduler](https://github.com/simplymadeapps/simple_scheduler) with Heroku scheduler.
