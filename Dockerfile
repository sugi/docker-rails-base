FROM ruby:2
ENV DEBIAN_FRONTEND noninteractive
RUN apt update
RUN apt -y full-upgrade
RUN apt -y install libicu-dev libsqlite3-dev
RUN apt-get clean
RUN adduser --system --disabled-password --uid 3000 --group --home /var/local/app rails
RUN gem install bundler --no-rdoc --no-ri
USER rails
ENV BUNDLE_APP_CONFIG /var/local/app/.bundle
CMD cd /var/local/app/current && exec bin/rails server
