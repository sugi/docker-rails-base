FROM ruby:2-wheezy
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y dist-upgrade
RUN apt-get -y install libicu-dev
RUN adduser --system --disabled-password --uid 3000 --group --home /var/local/app rails
RUN gem install puma --no-rdoc --no-ri
WORKDIR /var/local/app
USER rails
ENV BUNDLE_APP_CONFIG /var/local/app/.bundle
CMD bundle exec rails server -p 80
