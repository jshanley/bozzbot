// Commands:
//

'use strict';

let slackToken = process.env.HUBOT_SLACK_TOKEN;
let gifAppUrl = process.env.GIFHEAD_APPLICATION_URL;

module.exports = (robot) => {

  function getEmojiUrl(emojiName) {
    let promise = new Promise(function(resolve, reject) {
      robot.http(`https://slack.com/api/emoji.list?token=${slackToken}`)
        .get()(function(err, res, body) {
          if (err) {
            reject('Error looking up emoji URL.');
          } else {
            let parsedBody = JSON.parse(body);
            let emoji = parsedBody.emoji;
            let emojiUrl = emoji[emojiName];
            if (emojiUrl) {
              if (emojiUrl.slice(0,6) === 'alias:') {
                resolve(emoji[emojiUrl.slice(6)])
              } else {
                resolve(emojiUrl)
              }
            } else {
              reject(`No emoji found for name: ${emojiName}`)
            }
          }
        })
    })
    return promise;
  }

  function getGifUrl(gifName, headUrl) {
    let promise = new Promise(function(resolve, reject) {
      let postData = JSON.stringify({
        head_url: headUrl
      });
      robot.http(`${gifAppUrl}/api/${gifName}/annotate`)
        .header('Content-Type', 'application/json')
        .header('Accept', 'application/json')
        .post(postData)(function(err, res, body) {
          if (err) {
            reject('Error processing gif.')
          } else {
            let parsedBody = JSON.parse(body);
            let gifPath = parsedBody.gif;
            let gifUrl = gifAppUrl + gifPath;
            resolve(gifUrl);
          }
        })
    })
    return promise;
  }

  robot.respond(/gif list/i, (res) => {
    robot.http(`${gifAppUrl}/api`)
      .get()(function(err, r, body) {
        if (err) {
          res.send('Error looking up gifs.')
        } else {
          let parsedBody = JSON.parse(body);
          if (parsedBody && parsedBody.length) {
            parsedBody.map(entry => res.send(entry.name));
          } else {
            res.send('Baby! Your API broke...');
          }
        }
      })
  })

  robot.respond(/gif (\S+) (\S+)/i, (res) => {
    let gifName = res.match[1];
    let emoji = res.match[2];
    let emojiName = emoji.replace(/\:/g, '').trim()
    getEmojiUrl(emojiName)
      .then((emojiUrl) => {
        getGifUrl(gifName, emojiUrl)
          .then((gifUrl) => {
            res.send(gifUrl)
          })
          .catch((msg) => res.send(msg))
      })
      .catch((msg) => res.send(msg))
  })

}
