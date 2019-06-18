class ChangeDatabase01 < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :salaries, name: :staff
    remove_column :salaries, :staff_id
    drop_table :staffs
    add_reference :salaries, :user
    change_column :users, :gender, :integer
    add_reference :users, :position
    add_column :users, :permission, :integer
    change_column :dishes, :status, :boolean
    rename_column :dishes, :status, :is_display
    change_column :categories, :status, :boolean
    rename_column :categories, :status, :is_display
    rename_column :tables, :status, :is_taken
    rename_column :reservations, :status, :is_arrived
    add_column :reservations, :checked, :boolean, default: false
    remove_column :categories, :parent_id
    add_reference :categories, :category
  end
end
