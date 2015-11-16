module.exports = (robot) ->

  robot.respond /decide( (.+) (?:vs\.?|or) (.+))?(.+\,.+\,.+)?/i, (res) ->
    if res.match[1] and res.match[2] and res.match[3]
      res.reply res.random [res.match[2],res.match[3]]
    else if res.match[4]
      choices = res.match[4].split(',').map((s) -> s.trim()).filter((s) -> !!s)
      res.reply res.random choices
    else
      res.reply res.random ['yes','no']

  robot.respond /roll for (\S+)/i, (res) ->
    num = ~~(Math.random() * 100)
    user = robot.brain.userForName(res.match[1])
    if res.match[1] is 'me'
      res.reply num
    else if user and user.name
      res.send "#{user.name}: #{num}"
    else
      res.send "no users found with name: #{res.match[1]}"

  robot.respond /rps/i, (res) ->
    res.reply res.random ['rock','paper','scissors']
