class window.AppView extends Backbone.View
  template: _.template '
    <div class="button-container"><button class="hit-button">Hit</button> <button class="stand-button">Stand</button></div>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': ->
      @model.get('dealerHand').stand()
      @$('.stand-button').attr('disabled', 'true')
      @$('.hit-button').attr('disabled', 'true')
      #@$el.append('<div class=status></div>')
      $('.status').text(@model.winner() + ' wins')
      # alert(@model.winner()+ ' wins!')



  initialize: ->
    @render()
    # console.log(@$el[0].lastChild)
    # console.log(@$('.player-hand-container'))
    # $('score').text('as.dkfhj')
    # console.log(@$('.player-hand-container').attributes)

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el


