#!/bin/bash

channel=\"#papers\";
username=\"zotero_bot\";
icon_emoji=\":cow:\";
URL='https://hooks.slack.com/services/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'
#for example:
#URL='https://hooks.slack.com/foo/bar/000slack0'
while read TEXT; do
echo curl -s -X POST --data-urlencode \'payload={\"channel\": $channel, \"username\": $username, \"text\": \"$TEXT\", \"icon_emoji\": $icon_emoji}\' $URL | sh
echo $TEXT >> slack-zotero.log
date >> slack-zotero.log
sleep 2
done
exit 0
