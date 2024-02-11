#!/usr/bin/env bash

docker-compose run rails bundle exec rspec ./spec/models/checkbox_criterion_spec.rb --format json | grep -o '{.*}' | jq -r -c '.examples[]'
