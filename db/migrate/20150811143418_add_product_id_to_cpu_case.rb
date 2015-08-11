class AddProductIdToCpuCase < ActiveRecord::Migration
  def change
    add_column :cpu_cases, :product_id, :integer
  end
end
