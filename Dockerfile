# syntax = docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.3.2
FROM registry.docker.com/library/ruby:$RUBY_VERSION-slim AS base
RUN mkdir -pv /bundle/bin

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle

# Install packages needed to build gems
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libvips pkg-config

# Install application gems
WORKDIR /srv/app

COPY Gemfile /srv/app/Gemfile
COPY Gemfile.lock /srv/app/Gemfile.lock
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git && \
    bundle exec bootsnap precompile --gemfile

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile app/ lib/

# Install packages needed for deployment
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl libsqlite3-0 libvips && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

RUN mkdir -pv /srv/pids
RUN mkdir -pv /srv/app/data
RUN mkdir -pv /srv/app/log
RUN mkdir -pv /srv/app/public/system

# Copy built artifacts: gems, application
COPY  bin/docker-entrypoint /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint

# Entrypoint prepares the database.
ENTRYPOINT ["docker-entrypoint"]
ENV PATH="${BUNDLE_BIN}:${PATH}"

VOLUME ["/bundle"]
VOLUME ["/srv/app/data"]
VOLUME ["/srv/app/log"]
VOLUME ["/srv/app/tmp"]
VOLUME ["/srv/app/public/system"]

# Start the server by default, this can be overwritten at runtime
EXPOSE 4000
CMD ["bin/rails", "server", "-b", "0.0.0.0", "-p", "4000"]
