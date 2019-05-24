class CreateStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.string :phone_number
      t.string :address
      t.string :gender, default: 'male'
      t.date :birth_date
      t.boolean :status, default: true
      t.references :position, foreign_key: true

      t.timestamps
    end
  end
end
