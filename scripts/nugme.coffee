# Description:
#   Nugme, because you're dumb
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   bozz nug me - Receive a nug
#   bozz nug bomb N - get N nugs

module.exports = (robot) ->

  robot.respond /nug me/i, (msg) ->
    msg.http("http://nugme.herokuapp.com/random")
      .get() (err, res, body) ->
        msg.send JSON.parse(body).nug

  robot.respond /nug bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    msg.http("http://nugme.herokuapp.com/bomb?count=" + count)
      .get() (err, res, body) ->
        msg.send nug for nug in JSON.parse(body).nugs

  robot.respond /how many nugs are there/i, (msg) ->
    msg.http("http://nugme.herokuapp.com/count")
      .get() (err, res, body) ->
        msg.send "There are #{JSON.parse(body).nug_count} nugs."
