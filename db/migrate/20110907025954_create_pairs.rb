class CreatePairs < ActiveRecord::Migration
  def self.up
    create_table :pairs do |t|
      t.string :key
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :pairs
  end
end
