FROM ruby:1-wheezy
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y dist-upgrade
RUN apt-get -y install libsqlite3-dev
RUN apt-get clean
RUN adduser --system --disabled-password --uid 3000 --group --home /app rails
RUN gem install bundler --no-rdoc --no-ri
ADD runapp /
ENV BUNDLE_APP_CONFIG /app/.bundle
CMD /runapp
