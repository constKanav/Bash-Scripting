
# SSL Expiry Checker Script

## Overview
**sslexpirycheck.sh** is a Bash script designed to monitor the SSL certificate expiry dates of multiple websites. It calculates the number of days remaining until expiry and sends email notifications for critical thresholds using the Sendinblue API. This script automates SSL monitoring, ensuring timely renewal to maintain website security and trust.

---

## Features
- Extracts SSL certificate expiry dates using `openssl`.
- Calculates days remaining until expiry.
- Sends email alerts for critical thresholds (20, 15, 10, 7, 5, 3, 2, 1 days).
- Logs relevant outputs and removes temporary files after execution.

---

## Prerequisites
### Environment:
- Linux/Unix environment with shell access.

### Required Tools:
- **openssl**: For fetching SSL certificate details.
- **curl**: For interacting with the Sendinblue API.

### Sendinblue API Key:
1. Sign up for Sendinblue and generate an API key.
2. Replace the placeholder (`*************************`) in the script with your API key.

### Websites List File:
Create a `websites.txt` file in the same directory as the script. This file should contain one website URL per line.

---

## How It Works
1. **Input**: Reads website URLs from `websites.txt`.
2. **Fetch SSL Details**: Uses `openssl` to retrieve the SSL certificate for each website and extracts the expiry date.
3. **Calculate Expiry**: Determines the difference (in days) between the current date and the certificate expiry date.
4. **Email Notifications**: Sends an email to specified recipients if the remaining days match any of the critical thresholds.
5. **Output**: Displays expiry details in the terminal and sends email notifications when applicable.

---

## Setup and Execution

### 1. Clone or Download the Repository:
```bash
git clone https://github.com/<your-username>/<repository-name>.git
cd <repository-name>
```

### 2. Prepare the Websites List:
Create a `websites.txt` file in the same directory as the script and list one website URL per line:
```
example.com
example.org
testsite.com
```

### 3. Configure Email Settings:
Open the `sslexpirycheck.sh` script and update the following placeholders with your details:
- `name_of_sender`: Sender's name.
- `email_of_sender`: Sender's email address.
- `name_of_reciever`: Recipient's name.
- `email_of_reciever`: Recipient's email address.
- `email_of_reciever2`: Additional recipient's email address (optional).

### 4. Make the Script Executable:
```bash
chmod +x sslexpirycheck.sh
```

### 5. Execute the Script:
```bash
./sslexpirycheck.sh
```

---

## Example Output

### Terminal Output:
```
example.com will expire in 15 days
example.org will expire in 30 days
```

### Email Notification:

#### Subject:
```
SSL certificate for example.com will expire in 15 days.
```

#### Body:
```
Hello Team,

SSL certificate for example.com will expire in 15 days.
```

---

## Notes
- **Critical Expiry Thresholds**: Notifications are sent only for specific thresholds (20, 15, 10, 7, 5, 3, 2, 1 days before expiry).
- **Temporary Files**: Temporary files are created for certificate processing and deleted after execution.
- **Error Handling**: Ensure required tools (`openssl`, `curl`) are installed to avoid errors.

---

## Disclaimer
This script is provided "as is" without warranty of any kind. Use it responsibly, and understand its implications when running on production systems.
