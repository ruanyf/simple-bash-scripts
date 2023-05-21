#!/bin/bash

# Website URL to monitor
website_url="https://example.com"

# Function to print notification
print_notification() {
    echo "Website is down or unreachable: $website_url"
}

# Number of seconds between each check
check_interval=60

# Infinite loop to periodically check the website
while true; do
    # Send HTTP GET request to the website and store the response status code
    response_code=$(curl -s -o /dev/null -w "%{http_code}" "$website_url")

    # Check the response code
    if [[ $response_code -ne 200 ]]; then
        echo "Website is down. Sending notification..."
        print_notification
    else
        echo "Website is up. Response code: $response_code"
    fi

    sleep "$check_interval"
done
