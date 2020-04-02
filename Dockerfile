FROM ruby:2.7.0

RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev cron && rm -rf /var/lib/apt/lists/*

ENV RAILS_ENV development

ENV INSTALL_PATH /programador-homeoffice-api

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile ./

ENV BUNDLE_PATH /gems

COPY . .
