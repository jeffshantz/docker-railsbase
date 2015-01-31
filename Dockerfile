FROM jeffshantz/ruby

RUN groupadd --gid 1000 web && \
    useradd --create-home --uid 1000 --gid 1000 --no-user-group --shell /bin/bash web && \
    mkdir -p /app && \
    chown -R web:web /app

RUN apt-get update -qq && \
    apt-get install -y libmysqlclient-dev libpq-dev postgresql-client nodejs imagemagick libmagickcore-dev libmagickwand-dev && \
    apt-get clean && \
    curl -Ls https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.8-linux-x86_64.tar.bz2 | tar jx --wildcards --strip-components=2 --directory /usr/local/bin/ phantomjs-1.9.8-linux-x86_64/bin/phantomjs && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN gem install foreman --no-document

ENV GEM_HOME /home/web/.gem
ENV GEM_PATH ${GEM_HOME}:${GEM_PATH}
ENV PATH ${PATH}:${GEM_HOME}/bin

ADD gemrc /usr/local/etc/gemrc

WORKDIR /app
USER web
