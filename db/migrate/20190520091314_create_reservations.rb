class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :table_id
      t.integer :numbers_people
      t.boolean :status
      t.datetime :datetime

      t.timestamps
    end
  end
end
