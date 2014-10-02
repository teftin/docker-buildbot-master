# Using it

    docker run --link=MYSQLDB:db --volumes BUILDBOTSTATE:/bbot --env "DB_USER=bbot,DB_PASS=xxx,DB_DB=bbot"

    BUILDBOTSTATE will get initialized if needed. It contains configuration (modifable) and logs.
    MYSQLDB container has to be already running and needs user/database accessible using given password.

