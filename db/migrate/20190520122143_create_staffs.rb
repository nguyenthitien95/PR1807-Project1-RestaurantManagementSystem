class CreateStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :username
      t.string :password
      t.datetime :birthdate
      t.string :gender
      t.string :title
      t.float :base_salary

      t.timestamps
    end
  end
end
