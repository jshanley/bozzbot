module.exports = (robot) ->
  robot.respond /test attachments/i, (res) ->
    payload =
      message: res.message
      content:
        text: 'This is an attachment.'
        fallback: 'This will be shown if the attachment cannot display.'
        color: '#22aaee'
    robot.emit 'slack-attachment', payload
