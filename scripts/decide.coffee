module.exports = (robot) ->
  robot.respond /decide/i, (res) ->
    n = Math.random()
    reply = if n > 0.5 then 'yes' else 'no'
    res.reply reply
