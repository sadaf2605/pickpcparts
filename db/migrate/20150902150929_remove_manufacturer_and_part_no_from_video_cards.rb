class RemoveManufacturerAndPartNoFromVideoCards < ActiveRecord::Migration
  def change
    remove_column :video_cards, :manufacturer, :string
    remove_column :video_cards, :part_no, :string
  end
end
