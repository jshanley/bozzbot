module.exports = (robot) ->

 stunner_generator = (name) ->
   switch name
     when "@2dot" then return "http://i.imgur.com/2pE7Edx.gif"
     when "2dot" then return "http://i.imgur.com/2pE7Edx.gif"
     when "nate" then return "http://i.imgur.com/2pE7Edx.gif"
     when "@rat_boy" then return "http://i.imgur.com/8ynf6LR.gif"
     when "rat_boy" then return "http://i.imgur.com/8ynf6LR.gif"
     when "rat boy" then return "http://i.imgur.com/8ynf6LR.gif"
     when "steve" then return "http://i.imgur.com/8ynf6LR.gif"
     when "@mikelenehan" then return "http://i.imgur.com/eMq9jwR.gif"
     when "mikelenehan" then return "http://i.imgur.com/eMq9jwR.gif"
     when "mike" then return "http://i.imgur.com/eMq9jwR.gif"
     when "lenny" then return "http://i.imgur.com/eMq9jwR.gif"
     when "@jbizzy11" then return "http://i.imgur.com/n4zRyjK.gif"
     when "jbizzy11" then return "http://i.imgur.com/n4zRyjK.gif"
     when "jake" then return "http://i.imgur.com/n4zRyjK.gif"
     when "@shanman" then return "http://i.imgur.com/EZqglR8.gif"
     when "shanman" then return "http://i.imgur.com/EZqglR8.gif"
     when "shanley" then return "http://i.imgur.com/EZqglR8.gif"
     when "john" then return "http://i.imgur.com/EZqglR8.gif"
     when "@jordan" then return "http://i.imgur.com/sC6aU0F.gif"
     when "jordan" then return "http://i.imgur.com/sC6aU0F.gif"
     when "baby" then return "http://i.imgur.com/sC6aU0F.gif"
    

 
 robot.respond /stunner( (.+))?/i, (res) ->
   if res.match[1]
     if res.match[2]
       res.send stunner_generator(res.match[2])
     else
       res.send "https://media.giphy.com/media/1zMHJaMEdlsL6/giphy.gif"
   else
     res.send "https://media.giphy.com/media/1zMHJaMEdlsL6/giphy.gif"
