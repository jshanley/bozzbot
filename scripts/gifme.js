// Commands:
//

'use strict';

let slackToken = process.env.HUBOT_SLACK_TOKEN;

module.exports = (robot) => {

  robot.respond(/emoji url for (.+)/i, (res) => {
    let emojiName = res.match[1];
    emojiName = emojiName.replace(/\:/g, '');
    res.http(`https://slack.com/api/emoji.list?token=${slackToken}`)
      .get()(function(err, res, body) {
        let emoji = body.emoji;
        let emojiUrl = emoji[emojiName];
        if (emojiUrl) {
          if (emojiUrl.slice(0,6) === 'alias:') {
            res.send(emoji[emojiUrl.slice(6)])
          } else {
            res.send(emojiUrl)
          }
        } else {
          res.send(`No emoji found for name: ${emojiName}`)
        }
      })
  })

}
