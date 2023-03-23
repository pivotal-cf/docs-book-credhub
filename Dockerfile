FROM ubuntu

RUN apt-get update
RUN apt-get -y upgrade; apt-get clean

RUN apt-get install -y build-essential git curl libssl-dev libjpeg8 libxrender1; apt-get clean
RUN apt-get install -y libfontconfig1; apt-get clean
RUN git clone https://github.com/sstephenson/ruby-build.git && cd ruby-build && ./install.sh
RUN apt-get install -y wget

RUN ruby-build 2.0.0-p481 /usr/local
RUN gem install bundler --no-rdoc --no-ri
RUN mkdir -p /tmp/docs-docker/spec
RUN mkdir -p /tmp/docs-docker/master_middleman
COPY master_middleman /tmp/docs-docker/master_middleman
COPY spec /tmp/docs-docker/spec
COPY Rakefile /tmp/docs-docker/
COPY Gemfile-docker /tmp/docs-docker/Gemfile

RUN locale-gen en_US.UTF-8
ENV LC_ALL en_US.UTF-8

WORKDIR /tmp/docs-docker
RUN bundle install --binstubs
RUN bin/rake jasmine:ci
