users = require('../data/users.json')

module.exports = (robot) ->

  getSlugForName = (name) ->
    slackUser = robot.brain.userForName(name)
    if slackUser
      return getSlugForId(slackUser.id)
    else
      user = users.find (user) ->
        user.slug is name or user.aliases.some (a) -> a is name
      return if user then user.slug else null

  getSlugForId = (id) ->
    user = users.find (user) -> user.id is id
    return if user then user.slug else null

  allNamesAndAliases = []
  for user in users
    allNamesAndAliases.push(user.slug)
    allNamesAndAliases = allNamesAndAliases.concat(user.aliases)
    slackUser = robot.brain.userForId(user.id)
    allNamesAndAliases.push(slackUser.name)

  getAllUsersInString = (str) ->
    userNamesString = allNamesAndAliases.join('|')
    userNamesRegex = new RegExp(userNamesString, 'gi')
    userNames = str.match(userNamesRegex)
    if userNames and userNames.length
      userNames = userNames.map (name) -> name.toLowerCase()
      userSlugs = userNames.map(getSlugForName)
      return userSlugs
    else
      return null

  robot.brain.getSlugForName = getSlugForName
  robot.brain.getSlugForId = getSlugForId
  robot.brain.getAllUsersInString = getAllUsersInString
