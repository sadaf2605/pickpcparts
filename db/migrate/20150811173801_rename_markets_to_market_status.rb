class RenameMarketsToMarketStatus < ActiveRecord::Migration
 def self.up
    rename_table :markets, :market_statuses
  end

  def self.down
    rename_table :market_statuses, :markets
  end
end
