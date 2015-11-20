module.exports = (robot) ->

  users = require('../data/users.json');

  robot.listenerMiddleware (context, next, done) ->
    res = context.response
    userId = res.message.user.id
    steveModeEnabled = robot.brain.get('steveModeEnabled')
    if userId is users.steve.id and steveModeEnabled
      now = Date.now()
      steveRequests = robot.brain.get('steveRequests') or []
      steveRequests = steveRequests.filter (r) -> r.date > (now - 3600000)
      switch steveRequests.length
        when 0
          res.reply 'duster module stable; processing request...'
          steveRequests.push({ date: now })
          robot.brain.set('steveRequests', steveRequests)
          next(done)
        when 1
          res.reply 'duster module dusty; processing (cough) request...'
          steveRequests.push({ date: now })
          robot.brain.set('steveRequests', steveRequests)
          next(done)
        when 2
          res.reply 'duster module critical; shutdown imminent...'
          steveRequests.push({ date: now })
          robot.brain.set('steveRequests', steveRequests)
          next(done)
        else
          res.reply 'duster module disengaged; unable to respond to dusty requests.'
          res.message.finish()
          done()
    else
      next(done)

  robot.respond /reset steve mode/i, (res) ->
    if res.message.user.id is users.steve.id
      res.reply 'NAHHHHHHHHHHH'
    else
      res.send 'OK. Duster module repaired.'
      robot.brain.set('steveRequests', [])

  robot.respond /enable steve mode/i, (res) ->
    if res.message.user.id is users.steve.id
      res.reply 'NAHHHHHHHHHHH'
    else
      res.send 'OK. Duster module installed.'
      robot.brain.set('steveModeEnabled', true)

  robot.respond /disable steve mode/i, (res) ->
    if res.message.user.id is users.steve.id
      res.reply 'NAHHHHHHHHHHH'
    else
      res.send ':rat:'
      robot.brain.set('steveModeEnabled', false)
