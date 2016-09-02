FROM ruby:2-wheezy
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y dist-upgrade
RUN apt-get -y install libicu-dev libsqlite3-dev
RUN apt-get clean
RUN adduser --system --disabled-password --uid 3000 --group --home /var/local/app rails
RUN gem install bundler --no-rdoc --no-ri
USER rails
ENV BUNDLE_APP_CONFIG /var/local/app/.bundle
CMD cd /var/local/app/current && exec bin/rails server
