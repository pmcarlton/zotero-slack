zotero-slack
============

### Description:
Use Slack to get notified of new papers added to your Zotero group library, and who added them

### Details:

Quick HOWTO to organize:


#### The Zotero side:

- Log in to Zotero
- Go to Settings (click word "Settings" at top of page)
- Click "Feeds/Api" below "Zotero Settings"
- Click "create new private key" (or if you already have, copy its value)
- Add a key description like "Slack-RSS"
- Check that read-only or read-write permission is given to the group
- Click "Save Key"
- After returning to the "Feeds/Api" settings page, there should be an orange RSS icon next to the key code value. You need to copy the *link* from that icon, which is a link to your group library's RSS feed.

#### The RSS side:

- install `feedstail` using `pip` (see [here](https://github.com/pmcarlton/pubmed-rss-twitter) for instructions)
- run `feedstail` in the background so it fetches the RSS feed every few minutes, for example:

`nohup feedstail -e -r -f {title}__{author}__{link} -u "https://api.zotero.org/groups/YOURGROUPID/items/top?start=0&limit=25&key=YOURKEY" | perl -pe 'BEGIN{$|=1;} s/__/ — /g;s/$/\n/' | ./slack-zotero-send.sh &`

  (Remember to replace YOURGROUPID and YOURKEY with your actual group ID number and key value. The interstitial perl code is just to make the formatting a bit nicer.)

#### The Slack side:

- Add an "Incoming Webhook" integration, copy the webhook URL (scroll down a bit to see it), and save the settings.
- Add your copied webhook URL to the `slack-zotero-send.sh` program. Modify other values as desired (you don’t need to use the cow icon, for instance).
- Run `slack-zotero-send.sh` in the background
- Enjoy being informed each time a paper is added and see who it's added by.
