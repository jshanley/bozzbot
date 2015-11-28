// Description:
//   Have Bozz decide things
//
// Dependencies:
//   None
//
// Configuration:
//   None
//
// Commands:
//   bozz decide - Bozz answers "yes" or "no"
//   bozz decide <A> or <B> - Bozz picks A or B
//   bozz decide <A> vs <B> - Bozz picks A or B
//   bozz decide <a>,<b>,<c>,...,<z> - Bozz picks one of the choices provided
//   bozz roll - Roll a die for yourself
//   bozz roll for <username> - Roll a die for someone else
//   bozz set die sides <n> - Set the number of sides to use for rolls
//   bozz rps - Bozz replies "rock", "paper", or "scissors"

'use strict';

module.exports = (robot) => {
  robot.respond(/decide( (.+) (?:vs\.?|or) (.+))?(.+\,.+\,.+)?/i, (res) => {
    if(res.match[1] && res.match[2] && res.match[3]) {
      res.reply(res.random([res.match[2],res.match[3]]))
    } else if (res.match[4]) {
      var choices = res.match[4].split(',').map((s) => s.trim()).filter((s) => !!s)
      res.reply(res.random(choices))
    } else {
      res.reply(res.random(['yes','no']))
    }
  })

  robot.respond(/roll( for (\S+))?/i, (res) => {
    var sides = robot.brain.get('dieSides') || 20
    var num = ~~(Math.random() * sides) + 1

    if (res.match[1]) {
      let user = robot.brain.userForName(res.match[2])
      if (res.match[2] === 'me') {
        res.reply(num)
      } else if (user && user.name) {
        res.send(`${user.name}: ${num}`)
      } else {
        res.send(`no users found with name: ${res.match[2]}`)
      }
    } else {
      res.reply(num)
    }
  })

  robot.respond(/set die sides (\d+)/i, (res) => {
    let sides = parseInt(res.match[1], 10)
    robot.brain.set('dieSides', sides)
    res.send(`Die set to ${sides} sides.`)
  })

  robot.respond(/rps/i, (res) => {
    res.reply(res.random(['rock','paper','scissors']))
  })
}
