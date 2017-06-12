class Card < ActiveRecord::Base
  belongs_to :deck
  scope :for_review, (-> { where(review: true) })
end
