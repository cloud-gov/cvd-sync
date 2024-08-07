#!/usr/bin/env bash

# setup cvdupdate
mkdir -p ~root/.cvdupdate
python -m pip install cvdupdate

# kinda cheesy - cvdupdate doesn't support setting the state file from the command line
# so we just write the whole config file ourselves.
echo '{
    "nameserver": "",
    "max retry": 3,
    "log directory": "/home/cvdupdate/.cvdupdate/logs",
    "rotate logs": false,
    "# logs to keep": 30,
    "db directory": "'"${DATABASE_DIRECTORY:=/home/cvdupdate/.cvdupdate/database}"'",
    "rotate cdiffs": true,
    "# cdiffs to keep": 30,
    "state file": "'"${STATE_FILE:=/home/cvdupdate/.cvdupdate/state.json}"'"
}' > ~/.cvdupdate/config.json
/usr/local/bin/cvd update
