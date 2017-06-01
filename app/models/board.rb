class Board < ActiveRecord::Base
  has_many :categories
  belongs_to :game
end
