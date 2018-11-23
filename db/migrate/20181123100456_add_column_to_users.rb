class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :palettes_count, :integer, :default => 0

    User.reset_column_information
    User.all.each do |u|
      User.update_counters u.id, palettes_count: u.palettes.count
    end
  end

  def down
    remove_column :users, :palettes_count
  end
end
