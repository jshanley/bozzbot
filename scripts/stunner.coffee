# Description:
#   Stunnerz
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   bozz stunner <user> - stunners a user
#   bozz stunner <users...> - stunners any users mentioned
#   bozz stunner bomb - stunners everyone

stunners =
  jake: "http://i.imgur.com/n4zRyjK.gif"
  john: "http://i.imgur.com/EZqglR8.gif"
  jordan: "http://i.imgur.com/sC6aU0F.gif"
  mike: "http://i.imgur.com/eMq9jwR.gif"
  nate: "http://i.imgur.com/2pE7Edx.gif"
  steve: "http://i.imgur.com/8ynf6LR.gif"

module.exports = (robot) ->

 robot.respond /.*stunner( .+)?/i, (res) ->
   if res.match[1]
     if res.match[1].match(/bomb/i)
       for user, stunner of stunners
         res.send stunner
     else
       users = robot.brain.getAllUsersInString(res.match[1])
       if users and users.length
         users.map (user) ->
           res.send stunners[user]
       else
         res.send res.random (stunner for user, stunner of stunners)
   else
     res.send res.random (stunner for user, stunner of stunners)
