class CreateReservedDishes < ActiveRecord::Migration[5.1]
  def change
    create_table :reserved_dishes do |t|
      t.integer :reservation_id
      t.integer :dish_id
      t.integer :quantity
      t.references :reservation, foreign_key: true
      t.timestamps
    end
  end
end