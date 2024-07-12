#!/bin/bash
LOCAL=`dirname $0`;
cd $LOCAL
cd ../
PWD=`pwd`
read -r INPUT_JSON
SRCIP=$(echo $INPUT_JSON | jq -r .parameters.alert.data.srcip)
COMMAND=$(echo $INPUT_JSON | jq -r .command)
LOG_FILE="${PWD}/../logs/active-responses.log"
#------------------------ Analyze command -------------------------#
if [ ${COMMAND} = "add" ]
then
/usr/sbin/csf -td ${SRCIP}
echo "`date` /var/ossec/$0 Source IP $SRCIP Added to Blacklist" >> ${LOG_FILE}
else
/usr/sbin/csf -tr ${SRCIP}
echo "`date` /var/ossec/$0 Source IP $SRCIP Removed from Blacklist" >> ${LOG_FILE}
fi
exit 0;
