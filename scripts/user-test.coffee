module.exports = (robot) ->
  robot.hear /userinfo/i, (res) ->
    userinfo = res.message.user
    res.send "#{JSON.stringify(userinfo)}"
