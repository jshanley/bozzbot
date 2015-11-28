// Commands:
//   (jack|bozz) - Bozz gets offended (feel free to add as many exclamation points as you see fit)

'use strict';

let bozzisms = require('../data/bozzisms.json');

module.exports = (robot) => {
  robot.hear(/^(?:bozz|jack)\!*$/i, (res) => {
    res.send(res.random(bozzisms));
  })
}
