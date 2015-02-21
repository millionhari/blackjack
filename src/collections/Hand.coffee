class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())

# stand goes here
  stand: ->
    console.log('poop')

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the
    # original score, and score + 10.
    #[@minScore(), @minScore() + 10 * @hasAce()]
    # what if score is greater than 21?
    if @minScore() + 10 * @hasAce() > 21 and @minScore() < 21
      @minScore()
    else if @minScore() > 21 and @minScore() + 10 * @hasAce() > 21
      'YOU LOSE'
    else
      @minScore() + 10 * @hasAce()

  #busted: -> busted = false
