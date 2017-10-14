class CardsController < ApplicationController
  def new
    @card = Card.new
    @decks = Deck.all
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to decks_path
    else
      render @card
    end
  end

  def card_params
    params.require(:card).permit(:front, :back, :deck_id)
  end
end
