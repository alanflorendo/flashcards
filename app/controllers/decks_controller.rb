class DecksController < ApplicationController
  def show
    @cards = Card.all.shuffle.sample(4)
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
end
