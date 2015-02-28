#!/bin/bash

DB_URI="mysql://${DB_USER}:${DB_PASS}@${DB_PORT_3306_TCP_ADDR}:${DB_PORT_3306_TCP_PORT}/${DB_DB}"
export DB_URI

if [[ ! -f /bbot/buildbot.tac ]]; then
    echo "==> no buildbot environment, creating one"
    /bbot-ve/bin/buildbot create-master --db ${DB_URI} /bbot
else
    echo "==> kicking of upgrade"
    /bbot-ve/bin/buildbot upgrade-master  /bbot
fi

if [[ ! -f /bbot/master.cfg ]]; then
    echo "==> using example master.cfg"
    cp /bbot/master.cfg{.sample,}
else
    echo "==> config already exists"
fi

exec /bbot-ve/bin/buildbot start --nodaemon /bbot
