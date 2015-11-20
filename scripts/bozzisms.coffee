# Description:
#   Get Bozz all riled up
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   (jack|bozz) - Bozz gets offended (feel free to add as many exclamation points as you see fit)

bozzisms = require('../data/bozzisms.json');

module.exports = (robot) ->

  robot.hear /^(?:bozz|jack)\!*$/i, (res) ->
    res.send res.random bozzisms
