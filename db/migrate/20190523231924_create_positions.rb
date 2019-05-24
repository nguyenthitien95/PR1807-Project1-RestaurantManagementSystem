class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
      t.string :name
      t.string :description
      t.float :salary

      t.timestamps
    end
  end
end
