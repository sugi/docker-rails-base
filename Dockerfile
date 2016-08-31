FROM ruby:2.1
ENV DEBIAN_FRONTEND noninteractive
RUN apt update
RUN apt -y full-upgrade
RUN apt -y install libicu-dev
RUN adduser --system --disabled-password --uid 3000 --group --home /var/local/app rails
RUN gem install bundler --no-rdoc --no-ri
WORKDIR /var/local/app/current
USER rails
CMD exec bundle exec rails server
