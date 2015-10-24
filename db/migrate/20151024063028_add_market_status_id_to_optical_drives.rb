class AddMarketStatusIdToOpticalDrives < ActiveRecord::Migration
  def change
    add_column :optical_drives, :market_status_id, :integer
  end
end
