FROM ubuntu:16.04

WORKDIR /app

RUN apt-get update && apt-get install -y curl locales

# set locale
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Set up NODE JS download
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y nodejs

# Set up Erlang download
RUN set -xe \
    && curl -sL -o /tmp/erlang-solutions_1.0_all.deb \
    https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb \
    && dpkg -i /tmp/erlang-solutions_1.0_all.deb

RUN apt-get update && \
    apt-get install -y aptitude ca-certificates python python-dev python-pip \
                    python-virtualenv \
                    git \
                    nodejs \
                    elixir \
                    erlang-xmerl erlang-parsetools erlang-dev && \
    rm -rf /var/lib/apt/lists/*

# Set up ansible
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible

RUN mix local.hex --force
RUN mix local.rebar --force