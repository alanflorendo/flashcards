class DecksController < ApplicationController
  def index
    @cards = Card.all.shuffle.sample(4)
  end

  def batch_update
    card_flips = params[:cards]
    record_flips(card_flips)
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
end
