class DecksController < ApplicationController
  def index
    @cards = Card.all.shuffle.sample(4)
  end
end
