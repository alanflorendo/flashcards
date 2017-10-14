class CardsController < ApplicationController
  def index
    @deck = Deck.find(params[:deck_id])
    @cards = @deck.cards
  end

  def new
    @card = Card.new
    @decks = Deck.all
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      flash[:success] = 'The card was successfully created'
      redirect_to decks_path
    else
      flash[:error] = 'The card had an error'
      render @card
    end
  end

  def edit
    @card = Card.find(params[:id])
    @decks = Deck.all
  end

  def update
    @card = Card.find(params[:id])
    if @card.update_attributes(card_params)
      flash[:success] = 'The card was successfully updated'
      redirect_to decks_path
    else
      flash[:error] = 'The card had an error'
      render @card
    end
  end

  def card_params
    params.require(:card).permit(:front, :back, :deck_id)
  end
end
