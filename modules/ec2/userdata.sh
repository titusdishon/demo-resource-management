#!/bin/bash
set -e

yum update -y
yum install -y httpd
systemctl enable --now httpd

HOSTNAME=$(hostname)
PRIVATE_IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
AVAIL_ZONE=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)
REGION=${AVAIL_ZONE%?}

sudo su
touch /var/www/html/index.html
cat <<EOT > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Hello Titus Dishon</title>
  <style>
    :root { font-family: system-ui, -apple-system, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, Helvetica, Arial, "Apple Color Emoji", "Segoe UI Emoji"; }
    body { margin: 0; min-height: 100svh; display: grid; place-items: center; background: #f6f7f9; }
    .card { background: white; padding: 2.5rem 3rem; border-radius: 1.25rem; box-shadow: 0 10px 25px rgba(0,0,0,.08); text-align: center; }
    h1 { margin: 0 0 .75rem; font-size: clamp(1.75rem, 2.5vw + 1rem, 3rem); letter-spacing: .02em; }
    p { margin: 0; color: #555; }
  </style>
</head>
<body>
  <main class="card">
    <h1>Region: ${REGION}</h1>
    <h2>AZ: ${AVAIL_ZONE}</h2>
    <h2>Hostname: ${HOSTNAME}</h2>
    <h2>Private IP: ${PRIVATE_IP}</h2>
  </main>
</body>
</html>
EOT
