FROM ruby:2.4
ENV DEBIAN_FRONTEND noninteractive
RUN apt update
RUN apt -y full-upgrade && apt-get clean
RUN apt -y install libsqlite3-dev && apt-get clean
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y nodejs yarn && apt-get clean
RUN adduser --system --disabled-password --uid 3000 --group --home /app rails
RUN gem install bundler foreman --no-rdoc --no-ri
ADD runapp /
ENV BUNDLE_APP_CONFIG /app/.bundle
CMD /runapp
