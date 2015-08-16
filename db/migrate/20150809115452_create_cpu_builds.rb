class AddProductIdToCpu < ActiveRecord::Migration
  def change
    add_column :cpus, :product_id, :integer
  end
end
