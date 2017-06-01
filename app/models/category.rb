class Category < ActiveRecord::Base
  belongs_to :board
  has_many :questions
end
