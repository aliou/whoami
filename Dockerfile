# FROM aliou/elixir:1.4
FROM elixir:1.4

RUN mix local.hex --force && mix local.rebar --force
ENV MIX_ENV='prod'

ADD . /app
WORKDIR /app
RUN mix release

EXPOSE 4001

CMD ["_build/prod/rel/whoami/bin/whoami", "foreground"]
