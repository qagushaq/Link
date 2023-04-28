#!/bin/sh

# Install dependencies
bundle install

# Run pending migrations
rake db:setup
