module.exports = (robot) ->

  bozzisms = [
    'I love twinkies.'
    'It\'s not my birthday.'
    'Ya bastard!'
    'I\'m not going to college'
    'No! Bastard!'
  ]

  robot.hear /^bozz$/ ->
    res.send res.random bozzisms
