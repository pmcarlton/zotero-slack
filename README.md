zotero-slack
============

### Description:
Use Slack to get notified of new papers added to your Zotero group library, and who added them

### Details:

Quick HOWTO to organize:


#### The Zotero side:

- Log in to Zotero
- Go to your group Library page
- Click on the orange RSS icon that says "Subscribe to this feed".
- The next page asks you to create a private key. Add a key description like "Slack-RSS"
- Check that read-only or read-write permission is given to the group
- Click "Save Key"
- After saving, your browser will either load the RSS in its main page or ask you how to open it, etc. All you need to do at this point is copy the URL - it will start with `https://api.zotero.org/groups/…`
- Done with Zotero

#### The RSS fetching side:

- install `feedstail` using `pip` (see [here](https://github.com/pmcarlton/pubmed-rss-twitter) for instructions) on the computer that will constantly monitor your Zotero library and send notifications to Slack. This should be a computer that's always on, or a cloud server, etc.
- **AFTER** completing the Slack side (below), run `feedstail` in the background so it fetches the RSS feed every few minutes, for example:

`nohup feedstail -e -r -f '{title}__{author}__{link}' -u "https://api.zotero.org/groups/YOURGROUPID/items/top?start=0&limit=25&key=YOURKEY" | perl -pe 'BEGIN{$|=1;} s/__/ — /g;s/$/\n/' | ./slack-zotero-send.sh &`

  (Remember to replace YOURGROUPID and YOURKEY with your actual group ID number and key value. The interstitial perl code is just to make the formatting a bit nicer.)

#### The Slack side:

- Add an "Incoming Webhook" integration, copy the webhook URL (scroll down a bit to see it), and save the settings.
- Add your copied webhook URL to the `slack-zotero-send.sh` program. Modify other values as desired (you don’t need to use the cow icon, for instance).
- Run `slack-zotero-send.sh` in the background (see above)
- Enjoy being informed each time a paper is added and see who it's added by.
