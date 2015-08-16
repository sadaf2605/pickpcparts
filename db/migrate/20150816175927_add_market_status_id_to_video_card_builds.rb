class AddMarketStatusIdToVideoCardBuilds < ActiveRecord::Migration
  def change
    add_column :video_card_builds, :market_status_id, :integer
  end
end
