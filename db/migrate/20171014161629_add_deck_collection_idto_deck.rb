class AddDeckCollectionIdtoDeck < ActiveRecord::Migration
  def change
    add_column :decks, :deck_collection_id, :integer
  end
end
