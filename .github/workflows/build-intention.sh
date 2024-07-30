#!/usr/bin/env bash

echo "===> Create Intention"
# Create intention
cat ./.github/workflows/config-intention.json | jq "\
    .event.reason=\"${EVENT_REASON}\" | \
    .event.url=\"https://github.com/${GITHUB_REPOSITORY}/actions/runs/${GITHUB_RUN_ID}\" | \
    (.actions[] | select(.id == \"login\") .service.project) |= \"${PROJECT_NAME}\" | \
    (.actions[] | select(.id == \"login\") .service.name) |= \"${SERVICE_NAME}\" | \
    " > intention.json