FROM ubuntu:18.04

WORKDIR /app

RUN apt-get update && apt-get install -y curl locales

# Set locale
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8
ENV HOME=/root
ENV PATH="$HOME/.asdf/bin:$HOME/.asdf/shims:$PATH"

# Install dependencies
RUN apt-get update && \
    apt-get install -y aptitude ca-certificates python python-dev python-pip \
                    python-virtualenv \
                    git \
                    nodejs \
                    automake autoconf libreadline-dev libncurses-dev libssl-dev libyaml-dev libxslt-dev libffi-dev libtool unixodbc-dev unzip && \
    rm -rf /var/lib/apt/lists/*

# Install asdf
RUN git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.7.2

# Install node js
RUN asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git && \
    $HOME/.asdf/plugins/nodejs/bin/import-release-team-keyring && \
    asdf install nodejs 11.8.0 && \
    asdf global nodejs 11.8.0 && \
    rm -rf  /tmp/*

# Install erlang
RUN asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git && \
    asdf install erlang 22.0.2 && \
    asdf global erlang 22.0.2 && \
    rm -rf  /tmp/*

# Install elixir
RUN asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git && \
    asdf install elixir 1.9.0 && \
    asdf global elixir 1.9.0 && \
    rm -rf  /tmp/*

# Install hex and rebar
RUN mix local.hex --force
RUN mix local.rebar --force

# Set up ansible
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible