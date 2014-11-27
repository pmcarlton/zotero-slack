#!/bin/bash

channel=\"#papers\";
username=\"zotero_bot\";
icon_emoji=\":cow:\";
URL='PLACE YOUR WEBHOOK URL WITHIN THESE SINGLE QUOTES'
#for example:
#URL='https://hooks.slack.com/foo/bar/000slack0'
while read TEXT; do
echo curl -s -X POST --data-urlencode \'payload={\"channel\": $channel, \"username\": $username, \"text\": \"$TEXT\", \"icon_emoji\": $icon_emoji}\' $URL | sh
echo $TEXT >> $LOGDIR/slack-zotero.log
date >> $LOGDIR/slack-zotero.log
sleep 2
done
exit 0
