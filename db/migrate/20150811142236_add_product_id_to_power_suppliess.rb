class AddProductIdToPowerSuppliess < ActiveRecord::Migration
  def change
    add_column :power_supplies, :product_id, :integer
  end
end
