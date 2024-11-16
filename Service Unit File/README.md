

---

# Service Monitoring and Email Notification Script

This Bash script monitors the status of a specific systemd service and sends an email notification if the service is either inactive or failed. The script uses the Sendinblue API to send an email notification to a predefined list of recipients.

## Table of Contents
- Prerequisites
- Configuration
- Usage
- How It Works
- License

## Prerequisites
Before running the script, ensure the following are available on your system:
- `curl`: The script uses curl to send the email via Sendinblue API.
- `systemctl`: To check the status of the systemd service.
- **Sendinblue API Key**: You must have a Sendinblue account and generate an API key.

## Configuration
### Variables to Configure
- **SENDINBLUE_API_KEY**: Set your Sendinblue API key. You can get your API key by following the instructions in the Sendinblue API documentation.
  ```bash
  SENDINBLUE_API_KEY="your_sendinblue_api_key"
  ```

- **FROM_EMAIL**: The email address that will be shown as the sender of the notification email. Replace with your own email.
  ```bash
  FROM_EMAIL="your_email@example.com"
  ```

- **TO_EMAIL**: A comma-separated list of email addresses to receive the notification if the service fails. The script will send the notification to each of these email addresses.
  ```bash
  TO_EMAIL="recipient1@example.com,recipient2@example.com"
  ```

- **SUBJECT**: The subject line of the email notification. You can customize this as needed.
  ```bash
  SUBJECT="Service Monitor Alert"
  ```

- **SERVICE_NAME**: The name of the systemd service to monitor (e.g., nginx.service, apache2.service, etc.). Replace with the name of the service you want to monitor.
  ```bash
  SERVICE_NAME="your_service_name.service"
  ```

## Usage
Make sure the script has execute permissions:
```bash
chmod +x monitor_service.sh
```

Run the script manually:
```bash
./monitor_service.sh
```

Alternatively, you can set up a cron job to run the script at regular intervals (e.g., every 5 minutes).

### Example Cron Job
To run the script every 5 minutes, add the following line to your crontab:
```bash
*/5 * * * * /path/to/monitor_service.sh
```

## How It Works
### Service Monitoring
The script checks the status of the systemd service defined by the `SERVICE_NAME` variable. It uses `systemctl show -p ActiveState` to determine if the service is inactive or failed.

### Email Notification
If the service is found to be inactive or failed, the script constructs an email message and sends it using the Sendinblue API. The email is sent to the recipients defined in the `TO_EMAIL` variable.

### Customizable Message
The script sends a basic message indicating that the service is stopped or dead. You can customize the message content as needed in the script.
