# Description:
#   Insult someone with Michael Kors
#
# Dependencies:
#   None
#
#
# Commands:
#   korsify <thing> - give thing a horrible insult about their outfit
#
# Author:
#   traderzed

class Korsify

  constructor: (@robot) ->
    @insult_words = [
      'toilet paper',
      'shower loofa',
      'Mexican serape gay flag',
      'rigatoni',
      'Mad Max',
      'amish',
      'Mugler',
      'dowdy',
      'shiny',
      'short',
      'tight',
      'poofy',
      'MC Hammer',
      'vampire',
      'pregnant witch(!)',
      'sawdust',
      'tin man',
      'hershey kiss',
      'ballerina',
      'garbage',
      'newspaper',
      'ugly',
      'aztec cape',
      'Knot\'s Landing',
      'sharks teeth',
      'straight jacket',
      'Brady Bunch dashiki',
      'old diaper',
      'whacky',
      'flamenco dancer at a funeral',
      'metallic hefty bag',
      'disco soccer ball',
      'Joan Crawford',
      'Flintstone',
      'polyblend',
      'avocado goiter',
      'reggae Jesus',
      'sad chicken',
      'friar tuck',
      'tacky'
    ]
    @insult_clothes = [
      'ruched thing',
      'dress',
      'rag',
      'outfit',
      'uniform',
      'suit'
    ]

  insultWordsResponse: ->
    insultWordStringArr = []
    while insultWordStringArr.length < 6
      randomWord = @insult_words[Math.floor(Math.random() * @insult_words.length)]
      if insultWordStringArr.indexOf(randomWord) is -1
        insultWordStringArr.push(randomWord)

    return insultWordStringArr.join(", ")

  insultClothesResponse: ->
     @insult_clothes[Math.floor(Math.random() * @insult_clothes.length)]


module.exports = (robot) ->
  korsify = new Korsify robot

  robot.hear /korsify (\S+[^+:\s])/, (msg) ->
    string = msg.match[1]
    subject = string.charAt(0).toUpperCase() + string.slice(1)
    msg.send "#{subject}'s look today? It's like this #{korsify.insultWordsResponse()} #{korsify.insultClothesResponse()}. http://i.imgur.com/BbbCdF8.png"
