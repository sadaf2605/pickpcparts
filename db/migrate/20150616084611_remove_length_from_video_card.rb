class RemoveLengthFromVideoCard < ActiveRecord::Migration
  def change
    remove_column :video_cards, :length, :string
    add_column :video_cards, :length, :float
  end
end
