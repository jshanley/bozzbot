stunners =
  jake: "http://i.imgur.com/n4zRyjK.gif"
  john: "http://i.imgur.com/EZqglR8.gif"
  jordan: "http://i.imgur.com/sC6aU0F.gif"
  mike: "http://i.imgur.com/eMq9jwR.gif"
  nate: "http://i.imgur.com/2pE7Edx.gif"
  steve: "http://i.imgur.com/8ynf6LR.gif"
  blank: "https://media.giphy.com/media/1zMHJaMEdlsL6/giphy.gif"

module.exports = (robot) ->

 robot.respond /.*stunner( .+)?/i, (res) ->
   if res.match[1]
     if res.match[1].match(/bomb/i)
       for user, stunner in stunners
         res.send stunner
     else
       users = robot.brain.getAllUsersInString(res.match[1])
       if users and users.length
         users.map (user) ->
           res.send stunners[user]
       else
         res.send stunners.blank
   else
     res.send stunners.blank
