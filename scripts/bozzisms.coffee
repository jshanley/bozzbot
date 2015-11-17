module.exports = (robot) ->

  bozzisms = [
    'I love twinkies.'
    'It\'s not my birthday.'
    'Ya bastard!'
    'I\'m not going to college.'
    'No! Bastard!'
    'Okay! Ya think yer funny? Well yer an idiot!'
    'Shut up! It\'s not my birthday.'
    'No! Wha- pfft! Ya- Ya bastard!'
  ]

  robot.hear /^(?:bozz|jack)\!*$/i, (res) ->
    res.send res.random bozzisms
