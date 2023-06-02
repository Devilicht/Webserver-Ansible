#!/bin/sh
if [ -f .env ]; then
  source .env
fi
 
cat << EOT >> /home/vagrant/.ssh/authorized_keys
$SSH_KEY
EOT