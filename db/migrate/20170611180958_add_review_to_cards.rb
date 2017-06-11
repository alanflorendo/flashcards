class AddReviewToCards < ActiveRecord::Migration
  def change
    add_column :cards, :review, :boolean
  end
end
