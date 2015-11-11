module.exports = (robot) ->

  userIds =
    nate: 'U0E83CCFN'
    bozz: 'U0E8GUW8P'
    jake: 'U0E8TU3NV'
    jordan: 'U0E8J501Y'
    mike: 'U0E88F2BC'
    steve: 'U0E89CVJS'
    john: 'U0E880XRD'

  robot.listenerMiddleware (context, next, done) ->
    res = context.response
    userId = res.message.user.id
    if userId is userIds.steve
      res.reply 'duster module disengaged; unable to respond to dusty requests.'
      res.message.finish()
      done()
    else
      next(done)
