#!/bin/bash

# Slack webhook URL
WEBHOOK_URL="**************************************************************"

# List of Docker container names to monitor
CONTAINER_NAMES=("grafana" "kibana" "logstash" "elasticsearch")

# Function to check if a Docker container is running
check_container_status() {
    local container_name=$1
    local status=$(docker inspect --format='{{.State.Status}}' "$container_name")
    if [[ "$status" == "exited" || "$status" == "dead" ]]; then
        return 0  # Container is stopped or dead
    else
        return 1  # Container is running
    fi
}

# Function to send message to Slack
send_slack_message() {
    local container_name=$1
    local message="Docker container '$container_name' is either stopped or dead. Please check!"

    curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"$message\"}" "$WEBHOOK_URL"
}

# Main function to monitor specified Docker containers
monitor_containers() {
    for container_name in "${CONTAINER_NAMES[@]}"; do
        check_container_status "$container_name"
        if [ $? -eq 0 ]; then
            # Container is stopped or dead, trigger Slack message
            send_slack_message "$container_name"
        fi
    done
}

# Run the main function
monitor_containers
