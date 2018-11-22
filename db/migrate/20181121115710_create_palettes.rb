class CreatePalettes < ActiveRecord::Migration[5.2]
  def change
    create_table :palettes do |t|
      t.string :color, null: false
      t.integer :user_id, null: false
      t.integer :row, null: false
      t.integer :col, null: false

      t.timestamps
    end

    add_foreign_key :palettes, :users
  end
end
