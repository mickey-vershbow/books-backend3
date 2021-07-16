#!/bin/bash

# Rails-specific issue, deletes a pre-existing server, if it exists

set -e

rm -f /booksOnRails/backend/tmp/pids/server.pid

exec "$@"
