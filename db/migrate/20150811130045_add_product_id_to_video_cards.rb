class AddProductIdToVideoCards < ActiveRecord::Migration
  def change
    add_column :video_cards, :product_id, :integer
  end
end
