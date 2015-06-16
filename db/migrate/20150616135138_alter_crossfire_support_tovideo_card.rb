class AlterCrossfireSupportTovideoCard < ActiveRecord::Migration
  def change
    remove_column :video_cards, :crossfire_support, :string
    add_column :video_cards, :crossfire_support, :boolean
  end
end
