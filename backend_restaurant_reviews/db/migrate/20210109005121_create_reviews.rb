class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :description
      t.integer :score
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
