class CreateDeckCollections < ActiveRecord::Migration
  def change
    create_table :deck_collections do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
