FROM ruby:slim
ENV DEBIAN_FRONTEND noninteractive
RUN apt update
RUN apt -y full-upgrade
RUN apt -y install libicu-dev libsqlite3-dev
RUN apt-get clean
RUN adduser --system --disabled-password --uid 3000 --group --home /app rails
RUN gem install bundler --no-rdoc --no-ri
RUN gem install mini_portile2 --no-rdoc --no-ri
USER rails
ENV BUNDLE_APP_CONFIG /app/.bundle
CMD cd /app/current && exec bin/rails server -b 0
