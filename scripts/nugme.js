// Commands:
//   bozz nug me - Receive a nug
//   bozz nug bomb <n> - get n nugs

'use strict';

module.exports = (robot) => {
  robot.respond(/nug me/i, (msg) => {
    msg.http('http://nugme.herokuapp.com/random')
      .get()((err, res, body) => {
        msg.send(JSON.parse(body).nug)
      })
  })
  robot.respond(/nug bomb( (\d+))?/i, (msg) => {
    let count = msg.match[2] || 5;
    msg.http(`http://nugme.herokuapp.com/bomb?count=${count}`)
      .get()((err, res, body) => {
        let nugs = JSON.parse(body).nugs;
        nugs.map((nug) => msg.send(nug))
      })
  })

}
