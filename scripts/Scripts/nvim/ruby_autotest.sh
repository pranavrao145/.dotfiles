#!/usr/bin/env bash

docker-compose run rails bundle exec rspec $1 --format json | grep -o '{.*}' | jq -r -c '.examples[]'
