#!/bin/bash

declare -A SERVERS
SERVERS[551]=+38G
SERVERS[552]=+38G
SERVERS[553]=+38G
SERVERS[554]=+38G
SERVERS[555]=+38G
for key in "${!SERVERS[@]}"
do
  qm stop "$key"
	qm resize "$key" scsi0 "${SERVERS[$key]}"
	qm start "$key"
done