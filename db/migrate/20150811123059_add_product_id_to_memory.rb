class AddProductIdToMemory < ActiveRecord::Migration
  def change
    add_column :memories, :product_id, :integer
  end
end
