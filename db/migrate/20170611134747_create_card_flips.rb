class CreateCardFlips < ActiveRecord::Migration
  def change
    create_table :card_flips do |t|
      t.integer :card_id
      t.string :status

      t.timestamps null: false
    end
  end
end
