#!/usr/bin/env bash
set -euxo pipefail
# Ensure Nginx Config is Set
scripts/install-nginx-config.sh

# Checking MySQL TCP connection
scripts/wait-for-it.sh --timeout=60 $MYSQL_HOST:$MYSQL_PORT

# Start Server
# Python for Dev
# Hypercorn for Prod
python3.9 main.py
#hypercorn main.py
