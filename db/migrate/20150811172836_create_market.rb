class CreateMarket < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.integer :shop_id
      t.float :price
    end
  end
end
