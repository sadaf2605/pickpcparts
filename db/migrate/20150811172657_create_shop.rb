class CreateShop < ActiveRecord::Migration
  def self.up
    create_table :shops do |t|
      t.string :name
      t.string :location
      t.string :contact
    end
  end
  def self.down
    drop_table :shops
  end
end
