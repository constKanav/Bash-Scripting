#!/bin/bash

# Email configuration
SENDINBLUE_API_KEY="***********************************************************************************************"
FROM_EMAIL="abcd@outlook.com"
TO_EMAIL="xyz@outlook.com"
SUBJECT="#Give any subject of main here"

# Name of the service to monitor
SERVICE_NAME="xyz.service"

# Function to check if the service is stopped or dead
check_service_status() {
    local status=$(systemctl show -p ActiveState --value "$SERVICE_NAME")
    [[ "$status" == "inactive" || "$status" == "failed" ]]
}

# Function to send email using Sendinblue
send_email() {
    local message="Service '$SERVICE_NAME' is either stopped or dead!."
    local recipients="["

    # Split TO_EMAIL into an array
    IFS=',' read -ra recipients_array <<< "$TO_EMAIL"
    for recipient in "${recipients_array[@]}"; do
        recipients+="{\"email\":\"$recipient\"},"
    done
    recipients="${recipients%,}"  # Remove trailing comma
    recipients+="]"

    # Send email using curl
    curl -X POST \
        -H "Content-Type: application/json" \
        -H "api-key: $SENDINBLUE_API_KEY" \
        -d '{
            "sender": {"name": "Monitoring Service QMB", "email": "'"$FROM_EMAIL"'"},
            "to": '"$recipients"',
            "subject": "'"$SUBJECT"'",
            "htmlContent": "'"$message"'"
        }' \
        https://api.sendinblue.com/v3/smtp/email
}

# Main function to monitor the service
monitor_service() {
    if check_service_status; then
        # Service is stopped or dead, trigger email
        send_email
    fi
}

# Run the main function
monitor_service
