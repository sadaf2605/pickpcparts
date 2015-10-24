class AddMarketStatusIdToOpticalDriveBuilds < ActiveRecord::Migration
  def change
    add_column :optical_drive_builds, :market_status_id, :integer
  end
end
