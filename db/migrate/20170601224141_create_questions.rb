class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :category_id
      t.string :front
      t.string :back
      t.integer :value

      t.timestamps null: false
    end
  end
end
