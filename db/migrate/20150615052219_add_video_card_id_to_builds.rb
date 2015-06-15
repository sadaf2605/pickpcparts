class AddVideoCardIdToBuilds < ActiveRecord::Migration
  def change
    add_column :builds, :video_card_id, :integer
  end
end
