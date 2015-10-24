class RemoveMarketStatusIdToOpticalDrives < ActiveRecord::Migration
  def change
    remove_column :optical_drives, :market_status_id, :integer
  end
end
