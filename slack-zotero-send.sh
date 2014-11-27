#!/bin/bash

channel=\"#papers\";
username=\"zotero_bot\";
icon_emoji=\":cow:\";
URL=*REPLACE WITH YOUR WEBHOOK URL*
while read TEXT; do
echo curl -s -X POST --data-urlencode \'payload={\"channel\": $channel, \"username\": $username, \"text\": \"$TEXT\", \"icon_emoji\": $icon_emoji}\' $URL | sh
echo $TEXT >> $LOGDIR/slack-zotero.log
date >> $LOGDIR/slack-zotero.log
sleep 2
done
exit 0
