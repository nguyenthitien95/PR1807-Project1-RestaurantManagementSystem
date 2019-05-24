class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :table, foreign_key: true
      t.integer :numbers_people
      t.boolean :status
      t.datetime :date_time

      t.timestamps
    end
  end
end
