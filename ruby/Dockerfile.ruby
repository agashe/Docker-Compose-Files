FROM ruby:2.7.3-alpine

RUN apk add \
  build-base \
  postgresql-dev \
  tzdata \
  nodejs \
  npm \
  yarn

WORKDIR /app
COPY . /app

RUN rm -rf node_modules vendor
RUN gem install rails bundler
RUN bundle install
RUN yarn install

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]