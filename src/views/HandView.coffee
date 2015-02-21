class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', => @render()
    @render()
    # @collection.set('length', 3)
    # console.log(@collection.test())

  # update loss

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    # console.log(@collection.scores());
    @$('.score').text @collection.scores()

    # if @collection.scores()[1] > 22
    #   @$('.score').text @collection.scores()[0]
    # else
    #   @$('.score').text @collection.scores()[1]
    # if @collection.scores()[0] > 22 and @collection.scores()[1] > 22
    #   @$('.score').text 'YOU LOSE'

