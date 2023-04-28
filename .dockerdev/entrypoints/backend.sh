#!/bin/sh

# Install dependencies
bundle install

# Run pending migrations
rake db:migrate

# Remove stale server.pid
rm /app/tmp/pids/server.pid

# Start the server
rails server -b 0.0.0.0 -p 3000
