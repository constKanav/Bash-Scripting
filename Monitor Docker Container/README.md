---

# Docker Container Monitoring Script

## Description
This script monitors the status of specified Docker containers and sends a Slack message if any container is either stopped or dead. It is useful for alerting system administrators or DevOps teams when a critical container goes down.

## Prerequisites
- **Docker**: The script relies on the `docker` command to inspect the status of containers.
- **Slack Webhook URL**: A Slack webhook URL is required to send messages to a specific Slack channel.
- **curl**: The script uses `curl` to send HTTP POST requests to Slack.

## Features
- Monitors multiple Docker containers.
- Sends a Slack message if a container is stopped or dead.
- Can be easily customized to monitor different containers.

## Setup

### Step 1: Clone the Script
Clone or download this script to your local machine or server.

### Step 2: Modify the Script
- **Edit the Webhook URL**: Update the `WEBHOOK_URL` variable with your Slack incoming webhook URL. You can obtain this from your Slack workspace's settings.

- **Configure the Containers to Monitor**: Modify the `CONTAINER_NAMES` array to include the names of the Docker containers you want to monitor. For example:
  ```bash
  CONTAINER_NAMES=("qmbapidev_container" "kibana" "logstash" "elasticsearch")
  ```

### Step 3: Make the Script Executable
Make sure the script is executable:
```bash
chmod +x monitor_docker_containers.sh
```

### Step 4: Run the Script
You can run the script manually as follows:
```bash
./monitor_docker_containers.sh
```

### Step 5: Set up Cron Job (Optional)
To continuously monitor the containers, you can set up a cron job that runs the script at regular intervals (e.g., every 5 minutes). For example, add the following line to your crontab:
```bash
*/5 * * * * /path/to/monitor_docker_containers.sh
```

### Step 6: Slack Notifications
When a container is found to be stopped or dead, the script will send a message to the specified Slack channel with the following format:
```text
Docker container 'container_name' is either stopped or dead. Please check!
```

## Script Breakdown

### Webhooks and Container List
- The webhook URL (`WEBHOOK_URL`) is used to send messages to Slack.
- The containers you want to monitor are listed in the `CONTAINER_NAMES` array.

### Checking Container Status
- The script uses `docker inspect` to check the status of each container.
- It checks if the container is in the "exited" or "dead" state. If so, it considers the container to be down.

### Sending Slack Notification
- If a container is stopped or dead, the script sends a Slack message using `curl`.

## Example Output
If a container is stopped or dead, the following message will be posted in Slack:
```text
Docker container 'container_name' is either stopped or dead. Please check!
```

## Troubleshooting
- Ensure Docker is running on your machine or server.
- Verify that the container names in the `CONTAINER_NAMES` array are correct.
- Ensure you have the correct permissions to access Docker containers and send HTTP requests via `curl`.

---
