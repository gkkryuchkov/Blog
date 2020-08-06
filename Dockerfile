FROM ruby:2.6.5

ENV BUNDLER_VERSION=2.1.4

RUN apt-get update && apt-get install -y\
    apt-utils \
      binutils-gold \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      openssl \
      pkg-config \
      libpq-dev \
      python \
      tzdata && apt-get clean
RUN gem install bundler -v 2.1.4
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle check || bundle install
COPY package.json ./
COPY . ./
ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]

