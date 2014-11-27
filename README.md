zotero-slack
============

### Description:
Use Slack to see whenever someone adds a paper to your Zotero group library

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
'''
  /usr/local/bin/feedstail -e -r -f {title}__{author}__{link} -u https://api.zotero.org/groups/YOURGROUPID/items/top?start=0&limit=25&key=YOURKEY
  (replace YOURGROUPID and YOURKEY with your actual group ID number and key value)
'''
#### The Slack side:

- Add an "Incoming Webhook" integration, copy the webhook URL (scroll down a bit to see it), and save the settings.
- Add your copied webhook URL to the `slack-zotero-send.sh` program. Modify other values as needed.
- Run `slack-zotero-send.sh` in the background
- Enjoy being informed each time a paper is added and see who it's added by.
