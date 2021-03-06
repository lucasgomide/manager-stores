FROM ruby:2.5.1
ENV RAILS_ROOT=/usr/app/manager-stores
ENV RAILS_ENV=development
# Install essential Linux packages
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev postgresql-client libproj-dev nodejs less
RUN mkdir -p $RAILS_ROOT/tmp/pids
WORKDIR $RAILS_ROOT
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN  bundle install
COPY . .
EXPOSE 3000
