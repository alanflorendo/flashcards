class DecksController < ApplicationController
  def index
    @decks = deck_collection.decks
  end

  def show
    @deck = Deck.find(params[:id])
    @cards = @deck.cards.shuffle
  end

  def review
    @deck = Deck.find(params[:id])
    @cards = @deck.cards.for_review.shuffle
    render 'show'
  end

  def new
    @deck = Deck.new
    @deck_collections = DeckCollection.all
  end

  def edit
    @deck = Deck.find(params[:id])
    @deck_collections = DeckCollection.all
  end

  def create
    @deck = Deck.new(deck_params)
    if @deck.save
      flash[:success] = 'The deck was successfully created'
      redirect_to decks_path
    else
      flash[:error] = 'The deck had an error'
      render @deck
    end
  end

  def update
    @deck = Deck.find(params[:id])
    @deck.update_attributes(deck_params)
    if @deck.save
      flash[:success] = 'The deck was successfully created'
      redirect_to decks_path
    else
      flash[:error] = 'The deck had an error'
      render @deck
    end
  end

  def batch_update
    card_flips = params[:cards][:flips]
    card_reviews = params[:cards][:reviews]
    record_flips(card_flips)
    record_reviews(card_reviews)
    if request.xhr?
      render js: "document.location = '#{root_path}'"
    else
      redirect_to root_path
    end
  end

  private

  def deck_collection
    id = params[:id] ? DeckCollection.find_by(name: params[:id]) : DeckCollection.first
  end

  def record_flips(card_flips)
    card_flips.each do |card_id, status|
      CardFlip.create(card_id: card_id,
                      status: status)
    end
  end

  def record_reviews(card_reviews)
    card_reviews.each do |card_id, new_review|
      card = Card.find(card_id)
      card.update(review: new_review) if card.review != new_review
    end
  end

  def deck_params
    params.require(:deck).permit(:name, :deck_collection_id)
  end
end
