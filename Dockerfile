# Elixir 1.6: https://hub.docker.com/_/elixir/
FROM elixir:1.6.1

# This must match version in mix.exs
ARG APP_VERSION="0.0.1"

LABEL name="landbnb" \
      version=${APP_VERSION}

ENV MIX_ENV=dev
ENV REPLACE_OS_VARS=true
ENV PHOENIX_VERSION 1.3.0

RUN echo "Adding postgresql repo" \
  && echo  "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
  && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8

RUN  echo "Install packages" \
  && export DEBIAN_FRONTEND=noninteractive \
  && apt-get -y update \
  && apt-get install -qq -y \
      locales \
      curl \
      inotify-tools \
      jq \
      postgresql-client-9.5 --fix-missing --no-install-recommends \
  && echo "Setup locales" \
  && localedef -c -i en_NZ -f UTF-8 en_NZ.UTF-8 \
  && update-locale LANG=en_NZ.UTF-8 \
  && echo "Setup timezone" \
  && ln -sf /usr/share/zoneinfo/Pacific/Auckland /etc/localtime \
  && dpkg-reconfigure -f noninteractive tzdata \
  && echo "Create user" \
  && groupadd --gid 1000 appuser \
  && useradd -m --home /home/appuser --uid 1000 --gid appuser --shell /bin/sh appuser \
  && echo "Cleaning up" \
  && apt-get autoremove -y \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/*

RUN echo "Install hex, rebar and Phoenix framework" \
  && mix local.hex --force \
  && mix local.rebar --force \
  && mix hex.info \
  && mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new-$PHOENIX_VERSION.ez --force

RUN  echo "create app folder"

RUN mkdir /app

COPY . /app

WORKDIR /app

RUN  echo "install dependencies"

RUN mix deps.get

# see https://github.com/riverrun/comeonin/wiki/Deployment
RUN echo "Build bcrypt_elixir" \
  && cd deps/bcrypt_elixir && make clean && make

ENV PORT 4000

EXPOSE 4000

# run phoenix in *dev* mode on port 4000
# CMD mix phx.server
