class AddProductIdToMotherboardss < ActiveRecord::Migration
  def change
    add_column :motherboards, :product_id, :integer
  end
end
