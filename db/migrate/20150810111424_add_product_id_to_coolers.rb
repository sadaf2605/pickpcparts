class AddProductIdToCoolers < ActiveRecord::Migration
  def change
    add_column :coolers, :product_id, :integer
  end
end
