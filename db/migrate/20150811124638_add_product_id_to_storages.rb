class AddProductIdToStorages < ActiveRecord::Migration
  def change
    add_column :storages, :product_id, :integer
  end
end
