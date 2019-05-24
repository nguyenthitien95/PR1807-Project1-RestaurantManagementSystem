class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :address
      t.string :phone_number
      t.string :gender
      t.date :birth_date
      t.string :activation_digest
      t.boolean :activated
      t.datetime :activated_at
      t.string :reset_digest

      t.timestamps
    end
  end
end
