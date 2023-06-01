FROM ruby:2.7.4

ENV RAILS_ENV production
RUN mkdir /blog
RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.com
WORKDIR /blog
ADD Gemfile /blog
ADD Gemfile.lock /blog
ADD vendor/cache.tar.gz /blog/vendor/
# ADD vendor/rspec_api_documentation.tar.gz /mangosteen/vendor/ 
RUN bundle config set --local without 'development test'
RUN bundle install --local

ADD blog-*.tar.gz ./
ENTRYPOINT bundle exec puma