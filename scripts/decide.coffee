module.exports = (robot) ->
  robot.respond /decide( (.+) vs\.? (.+))?/i, (res) ->
    if res.match[1] and res.match[2] and res.match[3]
      res.reply res.random [res.match[2],res.match[3]]
    else
      res.reply res.random ['yes','no']
