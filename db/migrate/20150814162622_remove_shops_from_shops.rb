class RemoveShopsFromShops < ActiveRecord::Migration
  def change
    remove_column :shops, :shops, :string
  end
end
