FROM ruby:alpine
RUN apk update
RUN apk upgrade
RUN apk add icu-dev
RUN addgroup -g 3000 rails
RUN adduser -u 3000 -G rails -h /var/local/app -S -D rails
RUN gem install bundler --no-rdoc --no-ri
WORKDIR /var/local/app/current
USER rails
CMD exec bin/rails server
