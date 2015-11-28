'use strict';

let users = require('../data/users.json')

module.exports = (robot) => {

  let allNamesAndAliases = [];
  users.map((user) => {
    allNamesAndAliases.push(user.slug)
    allNamesAndAliases = allNamesAndAliases.concat(user.aliases)
    let slackUser = robot.brain.userForId(user.id)
    allNamesAndAliases.push(slackUser.name)
  })

  function getSlugForName(name) {
    let slackUser = robot.brain.userForName(name)
    if (slackUser) {
      return getSlugForId(slackUser.id);
    } else {
      let user = users.find((user) => user.slug === name || user.aliases.some((a) => a === name))
      if (user) {
        return user.slug
      } else {
        return null
      }
    }
  }

  function getSlugForId(id) {
    let user = users.find((user) => user.id === id)
    if (user) {
      return user.slug;
    } else {
      return null;
    }
  }

  function getAllUsersInString(str) {
    let userNamesString = allNamesAndAliases.join('|');
    let userNamesRegex = new RegExp(userNamesString, 'gi');
    let userNames = str.match(userNamesRegex);
    if (userNames && userNames.length) {
      let lowercaseNames = userNames.map((name) => name.toLowerCase())
      return lowercaseNames.map(getSlugForName)
    } else {
      return null;
    }
  }

  // add functions to the robot brain
  robot.brain.getSlugForName = getSlugForName;
  robot.brain.getSlugForId = getSlugForId;
  robot.brain.getAllUsersInString = getAllUsersInString;
}
