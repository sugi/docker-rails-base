FROM ruby:1-wheezy
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y dist-upgrade
RUN apt-get -y install libicu-dev
RUN apt-get clean
RUN adduser --system --disabled-password --uid 3000 --group --home /var/local/app rails
RUN gem install bundler --no-rdoc --no-ri
USER rails
CMD cd /var/local/app/current && exec bin/rails server
