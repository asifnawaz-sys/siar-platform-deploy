# Gunicorn configuration for SIAR Platform v4.5
# Production-ready settings

# Server socket
bind = "0.0.0.0:5000"
backlog = 2048

# Worker processes (use 4 for most applications)
workers = 4
worker_class = "sync"
worker_connections = 1000
timeout = 60
keepalive = 2

# Logging
accesslog = "logs/gunicorn_access.log"
errorlog = "logs/gunicorn_error.log"
loglevel = "info"
access_log_format = '%({X-Forwarded-For}i)s %(l)s %(u)s %(t)s "%(r)s" %(s)s %(b)s "%(f)s" "%(a)s"'

# Process naming
proc_name = "siar_platform"

# Server mechanics
daemon = False
umask = 0
user = None
group = None
tmp_upload_dir = None

# SSL (optional - add if using HTTPS)
# keyfile = "certs/key.pem"
# certfile = "certs/cert.pem"

# Application settings
max_requests = 1000
max_requests_jitter = 50
