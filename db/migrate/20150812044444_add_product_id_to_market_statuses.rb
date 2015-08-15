class AddProductIdToMarketStatus < ActiveRecord::Migration
  def change
    add_column :market_statuses, :product_id, :integer
  end
end