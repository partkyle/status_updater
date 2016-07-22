FROM ruby:2.1.5

WORKDIR /app
COPY Gemfile* /app/
RUN bundle install
COPY . /app
ENTRYPOINT ["./entrypoint"]
