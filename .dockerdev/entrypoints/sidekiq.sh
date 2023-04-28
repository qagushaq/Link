#!/bin/sh

echo "Starting Sidekiq"
bundle exec sidekiq -C config/sidekiq.yml