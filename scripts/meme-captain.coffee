# Description:
#   Get a meme from http://memecaptain.com/
#
# Dependencies:
#   None
#
# Commands:
#   bozz Y U NO <text> - Generates the Y U NO GUY with the bottom caption of <text>
#   bozz I don't always <something> but when i do <text> - Generates The Most Interesting man in the World
#   bozz <text> (SUCCESS|NAILED IT) - Generates success kid with the top caption of <text>
#   bozz <text> ALL the <things> - Generates ALL THE THINGS
#   bozz <text> TOO DAMN <high> - Generates THE RENT IS TOO DAMN HIGH guy
#   bozz Yo dawg <text> so <text> - Generates Yo Dawg
#   bozz All your <text> are belong to <text> - All your <text> are belong to <text>
#   bozz If <text>, <word that can start a question> <text>? - Generates Philosoraptor
#   bozz <text>, BITCH PLEASE <text> - Generates Yao Ming
#   bozz <text>, COURAGE <text> - Generates Courage Wolf
#   bozz ONE DOES NOT SIMPLY <text> - Generates Boromir
#   bozz IF YOU <text> GONNA HAVE A BAD TIME - Ski Instructor
#   bozz IF YOU <text> TROLLFACE <text> - Troll Face
#   bozz Aliens guy <text> - Aliens guy weighs in on something
#   bozz Brace yourself <text> - Ned Stark braces for <text>
#   bozz Iron Price <text> - To get <text>? Pay the iron price!
#   bozz Not sure if <something> or <something else> - Generates a Futurama Fry meme
#   bozz <text>, AND IT'S GONE - Bank Teller
#   bozz WHAT IF I TOLD YOU <text> - Morpheus What if I told you
#   bozz WTF <text> - Picard WTF
#   bozz IF <text> THAT'D BE GREAT - Generates Lumberg
#   bozz MUCH <text> (SO|VERY) <text> - Generates Doge
#   bozz <text> EVERYWHERE - Generates Buzz Lightyear
#   bozz steve <text>|<text> - Generates Steve meme
#   bozz chris's dad <text>|<text> - Generates Chris's dad meme
#   bozz buddy <text>|<text> - Generates Jack Bozz buddy meme
#   bozz i like babies <text>|<text> - Generates I like babies meme
#   bozz lenny <text>|<text> - Generates thumbs up Lenny meme
#   bozz shanley <text>|<text> - Generates stoned Shanley meme
#   bozz jake <text>|<text> - Generates steamroller Jake meme
#
# Author:
#   bobanj, ericjsilva

module.exports = (robot) ->
  robot.respond /Y U NO (.+)/i, (msg) ->
    memeGenerator msg, 'NryNmg', 'Y U NO', msg.match[1], (url) ->
      msg.send url

  robot.respond /iron price (.+)/i, (msg) ->
    memeGenerator msg, 'q06KuA', msg.match[1], 'Pay the iron price', (url) ->
      msg.send url

  robot.respond /aliens guy (.+)/i, (msg) ->
    memeGenerator msg, 'sO-Hng', msg.match[1], '', (url) ->
      msg.send url

  robot.respond /brace yourself (.+)/i, (msg) ->
    memeGenerator msg, '7KY5sQ', 'Brace Yourself', msg.match[1], (url) ->
      msg.send url

  robot.respond /(.*) (ALL the .*)/i, (msg) ->
    memeGenerator msg, 'cKjh_w', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(I DON'?T ALWAYS .*) (BUT WHEN I DO,? .*)/i, (msg) ->
    memeGenerator msg, 'V8QnRQ', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(.*)(SUCCESS|NAILED IT.*)/i, (msg) ->
    memeGenerator msg, 'AbNPRQ', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(.*) (\w+\sTOO DAMN .*)/i, (msg) ->
    memeGenerator msg, 'RCkv6Q', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(NOT SURE IF .*) (OR .*)/i, (msg) ->
    memeGenerator msg, 'CsNF8w', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(YO DAWG .*) (SO .*)/i, (msg) ->
    memeGenerator msg, 'Yqk_kg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(All your .*) (are belong to .*)/i, (msg) ->
    memeGenerator msg, 'Ss_hXw', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(.*)\s*BITCH PLEASE\s*(.*)/i, (msg) ->
    memeGenerator msg, 'jo9J0Q', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(.*)\s*COURAGE\s*(.*)/i, (msg) ->
    memeGenerator msg, 'IMQ72w', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /ONE DOES NOT SIMPLY (.*)/i, (msg) ->
    memeGenerator msg, 'da2i4A', 'ONE DOES NOT SIMPLY', msg.match[1], (url) ->
      msg.send url

  robot.respond /(IF YOU .*\s)(.* GONNA HAVE A BAD TIME)/i, (msg) ->
    memeGenerator msg, 'lfSVJw', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(.*)TROLLFACE(.*)/i, (msg) ->
    memeGenerator msg, 'dGAIFw', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(IF .*), ((ARE|CAN|DO|DOES|HOW|IS|MAY|MIGHT|SHOULD|THEN|WHAT|WHEN|WHERE|WHICH|WHO|WHY|WILL|WON\'T|WOULD)[ \'N].*)/i, (msg) ->
    memeGenerator msg, '-kFVmQ', msg.match[1], msg.match[2] + (if msg.match[2].search(/\?$/)==(-1) then '?' else ''), (url) ->
      msg.send url

  robot.respond /(.*)(AND IT\'S GONE.*)/i, (msg) ->
    memeGenerator msg, 'uIZe3Q', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /WHAT IF I TOLD YOU (.*)/i, (msg) ->
    memeGenerator msg, 'fWle1w', 'WHAT IF I TOLD YOU', msg.match[1], (url) ->
      msg.send url

  robot.respond /WTF (.*)/i, (msg) ->
    memeGenerator msg, 'z8IPtw', 'WTF', msg.match[1], (url) ->
      msg.send url

  robot.respond /(IF .*)(THAT'D BE GREAT)/i, (msg) ->
    memeGenerator msg, 'q1cQXg', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(MUCH .*) ((SO|VERY) .*)/i, (msg) ->
    memeGenerator msg, 'AfO6hw', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /(.*)(EVERYWHERE.*)/i, (msg) ->
    memeGenerator msg, 'yDcY5w', msg.match[1], msg.match[2], (url) ->
      msg.send url

  robot.respond /steve (.+)/i, (msg) ->
    makeCustomSplitMeme(msg, 'iWBIPQ')

  robot.respond /chris's dad (.+)/i, (msg) ->
    makeCustomSplitMeme(msg, 'NjdUIw')

  robot.respond /buddy (.+)/i, (msg) ->
    makeCustomSplitMeme(msg, 'uQK6Dw')

  robot.respond /i like babies (.+)/i, (msg) ->
    makeCustomSplitMeme(msg, 'qkqezg')
  
  robot.respond /lenny (.+)/i, (msg) ->
    makeCustomSplitMeme(msg, 'IeniJw')

  robot.respond /shanley (.+)/i, (msg) ->
    makeCustomSplitMeme(msg, 'gMDJIQ')

  robot.respond /jake (.+)/i, (msg) ->
    makeCustomSplitMeme(msg, 's03E1Q')

makeCustomSplitMeme = (msg, code) ->
  text = msg.match[1]
  split = text.split('|')
  topText = ''
  bottomText = ''
  if split.length is 2
    topText = split[0]
    bottomText = split[1]
  else
    topText = text
  memeGenerator msg, code, topText, bottomText, (url) ->
    msg.send url

memeGeneratorUrl = 'http://memecaptain.com/gend_images'

getDataPayload = (imageName, topText, botText) ->
  data = getDataPayloadAdv(imageName, topText, botText, 0.05, 0, 0.9, 0.25, 0.05, 0.75, 0.9, 0.25)
  return data


getDataPayloadAdv = (imageName, topText, botText, topX, topY, topW, topH, botX, botY, botW, botH) ->
  data = {
    src_image_id: imageName,
    private: true,
    captions_attributes: [
      {
        text: topText,
        top_left_x_pct: topX,
        top_left_y_pct: topY,
        width_pct: topW,
        height_pct: topH
      },
      {
        text: botText,
        top_left_x_pct: botX,
        top_left_y_pct: botY,
        width_pct: botW,
        height_pct: botH
      }
    ]
  }
  return JSON.stringify(data)


memeGenerator = (msg, imageName, topText, botText, callback) ->
  processResult = (err, res, body) ->
    return msg.send err if err
    if res.statusCode == 303
      callback res.headers.location
    if res.statusCode == 202
      timer = setInterval(->
        msg.http(res.headers.location).get() (err, res, body) ->
          if res.statusCode == 303
            callback res.headers.location
            clearInterval(timer)
      , 2000)
    if res.statusCode > 300
      msg.reply "Sorry, I couldn't generate that meme. Unexpected status from memecaptain.com: #{res.statusCode}"
      return

  msg.http(memeGeneratorUrl)
  .header("Content-Type", "application/json")
  .header("Accept", "application/json")
  .post(getDataPayload(imageName, topText, botText)) processResult


memeGeneratorAdv = (msg, imageName, topText, botText, topX, topY, topW, topH, botX, botY, botW, botH, callback) ->
  processResult = (err, res, body) ->
    return msg.send err if err
    if res.statusCode == 303
      callback res.headers.location
    if res.statusCode == 202
      timer = setInterval(->
        msg.http(res.headers.location).get() (err, res, body) ->
          if res.statusCode == 303
            callback res.headers.location
            clearInterval(timer)
      , 2000)
    if res.statusCode > 300
      msg.reply "Sorry, I couldn't generate that meme. Unexpected status from memecaptain.com: #{res.statusCode}"
      return

  msg.http(memeGeneratorUrl)
  .header("Content-Type", "application/json")
  .header("Accept", "application/json")
  .post(getDataPayloadAdv(imageName, topText, botText, topX, topY, topW, topH, botX, botY, botW, botH)) processResult
