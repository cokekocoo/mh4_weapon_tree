class CreateTwinSwords < ActiveRecord::Migration
  def change
    create_table :twin_swords do |t|
      t.string :name
      t.integer :rarity
      t.integer :power
      t.integer :red_length
      t.integer :orange_length
      t.integer :green_length
      t.integer :blue_length
      t.integer :white_length
      t.integer :strike_ratio
      t.integer :slots_count

      t.timestamps
    end
  end
end
