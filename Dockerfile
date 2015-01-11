FROM jeffshantz/ruby

ENV GEM_HOME /home/web/.gem
ENV GEM_PATH ${GEM_HOME}:/usr/local/lib/ruby/gems/2.2.0/
ENV PATH ${PATH}:${GEM_HOME}/bin

RUN apt-get update -qq && \
    apt-get install -y libmysqlclient-dev libpq-dev nodejs imagemagick libmagickcore-dev libmagickwand-dev && \
    apt-get clean && \
    mkdir -p /app && \
    groupadd --gid 1000 web && \
    useradd --create-home --uid 1000 --gid 1000 --no-user-group --shell /bin/bash web && \
    chown -R web:web /app && \
    curl -Ls https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-x86_64.tar.bz2 | tar jx --wildcards --strip-components=2 --directory /usr/local/bin/ phantomjs-1.9.7-linux-x86_64/bin/phantomjs && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD gemrc /usr/local/etc/gemrc

WORKDIR /app
USER web

RUN gem install foreman
