bozzisms = require('../data/bozzisms.json');

module.exports = (robot) ->

  robot.hear /^(?:bozz|jack)\!*$/i, (res) ->
    res.send res.random bozzisms
