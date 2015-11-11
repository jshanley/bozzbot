module.exports = (robot) ->

  users =
    nate:
      id: 'U0E83CCFN'
    jake:
      id: 'U0E8TU3NV'
    jordan:
      id: 'U0E8J501Y'
    mike:
      id: 'U0E88F2BC'
    steve:
      id: 'U0E89CVJS'
    john:
      id: 'U0E880XRD'

  robot.listenerMiddleware (context, next, done) ->
    res = context.response
    userId = res.message.user.id
    if userId is users.john.id
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
