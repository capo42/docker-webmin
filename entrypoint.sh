#!/bin/bash
set -e

# Passwort setzen (nur beim ersten Start)
if [ ! -f /etc/webmin/.docker_initialized ]; then
    echo "🛡️  Setting Webmin password for user 'root'"
    /usr/share/webmin/changepass.pl /etc/webmin root rootpass
    touch /etc/webmin/.docker_initialized
fi

# Startlog folgen, um Container aktiv zu halten (auch wenn log noch nicht existiert)
echo "🚀 Webmin should now be running in background..."
exec tail --retry -F /var/webmin/miniserv.log

