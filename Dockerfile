FROM elixir:1.4
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY mix.exs .
COPY mix.lock .
RUN mix local.rebar --force
RUN mix local.hex --force
RUN mix deps.get
RUN mix deps.compile
RUN mix dialyzer --plt
COPY . .
RUN mix compile
CMD ["iex", "-S", "mix"]
