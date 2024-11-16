
# SSL Certificate Expiration Monitoring Script

## Overview
This script monitors the expiration dates of SSL certificates for a list of websites. It checks the certificate expiration date, calculates the number of days remaining, and sends an email alert when the certificate is close to expiration (e.g., within 1, 2, 3, 5, 7, 10, 15, or 20 days). The email is sent using the Sendinblue API.

## Prerequisites
- **OpenSSL**: The script uses OpenSSL to retrieve SSL certificates from websites.
- **curl**: The script uses curl to send email alerts using the Sendinblue API.
- **Sendinblue API Key**: You need a valid Sendinblue API key to send emails.
- **Websites List**: The script requires a file named `websites.txt`, which contains a list of websites to monitor, with one website per line.

## Features
- Retrieves SSL certificate expiration date.
- Sends email notifications when the certificate is about to expire (1, 2, 3, 5, 7, 10, 15, 20 days).
- Can be customized to check a different list of websites.

## Setup Instructions

### Step 1: Install Required Dependencies
Ensure that you have the following installed on your machine:
- **OpenSSL**: Used for retrieving SSL certificate details.
- **curl**: Used to interact with the Sendinblue API for sending email notifications.

### Step 2: Create `websites.txt` File
Create a file named `websites.txt` in the same directory as the script. Each line in this file should contain the URL of a website to monitor.

For example:
```
example.com
google.com
github.com
```

### Step 3: Customize Script Configuration
- **Modify Sender and Receiver Information**: Update the following variables with the appropriate sender and receiver details:
  ```bash
  name_of_sender="Your Name"
  email_of_sender="your-email@domain.com"
  name_of_reciever="Recipient Name"
  email_of_reciever="recipient-email@domain.com"
  email_of_reciever2="another-recipient-email@domain.com"
  ```

- **Sendinblue API Key**: Insert your Sendinblue API key into the `--header 'api-key: YOUR_API_KEY'` field in the script.

- **Adjust Expiration Thresholds (Optional)**: The script currently sends email alerts when the SSL certificate is within 1, 2, 3, 5, 7, 10, 15, or 20 days of expiration. You can adjust this logic as needed in the conditional block:
  ```bash
  if  [ $a -eq 20 ] || [ $a -eq 15 ] || [ $a -eq 10 ] || [ $a -eq 7 ] || [ $a -eq 5 ] || [ $a -eq 3 ] || [ $a -eq 2 ] || [ $a -eq 1 ]
  ```

### Step 4: Run the Script
Execute the script by running the following command:
```bash
./ssl_certificate_monitor.sh
```
Make sure the script has execute permissions:
```bash
chmod +x ssl_certificate_monitor.sh
```

### Step 5: Monitor SSL Expiration
The script will check each website listed in the `websites.txt` file for SSL certificate expiration. If any certificate is within the defined expiration threshold, an email alert will be sent to the specified recipients.

## Example Email
When the SSL certificate for a website is close to expiration, the email sent to the recipients will look like this:
```
Subject: SSL certificate for example.com will expire in 10 days.

Hello Team,
SSL certificate for example.com will expire in 10 days.
```

---

