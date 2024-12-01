# image based on fluentd latest
FROM fluentd:latest
# Use root account to use apk
USER root
# Install the required version of faraday
RUN gem uninstall -I faraday
RUN gem install faraday -v 2.8.1
# Install dependencies and gems
RUN apk --no-cache --update add \
    sudo \
    build-base \
    ruby-dev \
  && gem uninstall -I elasticsearch \
  && gem install elasticsearch -v 7.17.0 \
  && gem install fluent-plugin-elasticsearch \
  && gem sources --clear-all \
  && apk del build-base ruby-dev \
  && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem
