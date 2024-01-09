FROM ruby:3.0.0

COPY . .

RUN bundle

EXPOSE 3000

CMD [ "redis-server" ]
CMD [ "bundle exec sidekiq" ]
CMD [ "rails", "server" ]