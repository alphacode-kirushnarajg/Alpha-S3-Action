#!/bin/sh -l

set -eu

TEMP_SFTP_FILE='../sftp'

if [ -z "$6" ]; then
   echo 'Error: Remote path cannot be empty.'
   exit 1
fi

echo 'Using SSH password authentication...'

echo "Creating remote directory..."
sshpass -p "${4}" ssh -o StrictHostKeyChecking=no -p "${3}" "${1}@${2}" "mkdir -p ${6}"

echo 'Starting upload to s3...'
printf "%s" "put -r ${5} ${6}" >${TEMP_SFTP_FILE}
SSHPASS="${4}" sshpass -e sftp -oBatchMode=no -b "${TEMP_SFTP_FILE}" -P "${3}" ${8} -o StrictHostKeyChecking=no "${1}@${2}"

echo 'Deployment successful!'
exit 0