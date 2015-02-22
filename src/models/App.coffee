# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    #@$el.append('<div class=status></div>')
    # $('.status').text('ALSKHJDFAKLDFH')
    # console.log(@.attributes.playerHand.scores())
    # console.log(@.attributes.dealerHand.scores())

    # method: who's winning
    #   returns either player or dealer
    # app view: display who wins
  winner: ->
    if @.attributes.playerHand.scores() > @.attributes.dealerHand.scores() and @.attributes.playerHand.scores() isnt 'YOU LOSE'
      'player'
    else if @.attributes.dealerHand.scores() > @.attributes.playerHand.scores() and @.attributes.dealerHand.scores() isnt 'YOU LOSE'
      'dealer'
    else if @.attributes.playerHand.scores() is 'YOU LOSE'
      'dealer'
    else if @.attributes.dealerHand.scores() is 'YOU LOSE'
      'player'
    else
      'Nobody'
