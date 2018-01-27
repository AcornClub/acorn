FROM ruby:2.4.3
LABEL maintainer="Acorn Club"\
  description="Acorn"

ENV APP_HOME=/app/acorn

RUN echo 'deb http://deb.debian.org/debian jessie main\n\
deb http://deb.debian.org/debian jessie-updates main\n\
deb http://security.debian.org jessie/updates main' \
    > /etc/apt/sources.list \
  && apt-get clean \
  && apt-get update && apt-get install -qy apt-transport-https \
    build-essential \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee \
    /etc/apt/sources.list.d/yarn.list \
  && bash -c 'curl -sL https://deb.nodesource.com/setup_9.x | bash -' \
  && apt-get install -qy mysql-client qt5-default libqt5webkit5-dev \
    gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x nodejs yarn

RUN wget https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64.deb
RUN dpkg -i dumb-init_*.deb

RUN yarn global add gulp-cli && yarn global add stylelint
RUN mkdir -p $APP_HOME/
WORKDIR $APP_HOME
COPY ["Gemfile", "Gemfile.lock", "$APP_HOME/"]

RUN bundle install && yarn && npm rebuild node-sass

EXPOSE 3000
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

# Regarding the rebuild, see
# [this issue](https://github.com/sass/node-sass/issues/1579)
CMD ["/bin/bash", "-c", "rm tmp/pids/server.pid; \
  yarn \
  && npm rebuild node-sass \
  && bundle install \
  && bundle exec rake db:create db:migrate assets:precompile \
  && bundle exec puma -C ./config/puma.rb"]
