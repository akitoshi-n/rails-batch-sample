FROM ruby:2.7.1

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    vim \
    cron

ENV APP_ROOT /rails-batch-sample

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT
RUN bundle install

COPY . $APP_ROOT

RUN bundle exec whenever --update-crontab
CMD ["cron", "-f"]
