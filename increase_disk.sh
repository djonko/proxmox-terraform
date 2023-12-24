#!/bin/bash

declare -A SERVERS
SERVERS[556]=+38G
SERVERS[551]=+38G
SERVERS[552]=+38G
SERVERS[553]=+38G
SERVERS[554]=+38G
for key in "${!SERVERS[@]}"
do
	qm resize "$key" scsi0 "${SERVERS[$key]}"
done