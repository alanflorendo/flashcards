class DecksController < ApplicationController
  def index
    @cards = Card.all.shuffle.sample(10)
  end
end
