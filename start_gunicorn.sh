#!/bin/bash
# Start SIAR Platform with Gunicorn
# Production deployment script

# Navigate to backend directory
cd "$(dirname "$0")"

# Check if gunicorn is installed
if ! command -v gunicorn &> /dev/null; then
    echo "Installing gunicorn..."
    pip install gunicorn
fi

# Create logs directory if it doesn't exist
mkdir -p logs

# Start gunicorn with configuration
echo "Starting SIAR Platform v4.5 with Gunicorn..."
echo "Server running at http://0.0.0.0:5000"
echo "Access via: http://localhost:5000"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

gunicorn -c gunicorn_config.py complete_platform_final:app
