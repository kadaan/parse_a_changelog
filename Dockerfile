FROM ruby:2.6-alpine

RUN gem install bundler --no-document
RUN bundle config set without 'test development'
COPY ./Gemfile .
RUN bundle install --binstubs=/app
ENV PATH=/app:${PATH}

ENTRYPOINT ["parse"]
CMD ["/CHANGELOG.md"]
