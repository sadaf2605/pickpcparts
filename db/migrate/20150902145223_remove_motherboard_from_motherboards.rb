class RemoveMotherboardFromMotherboards < ActiveRecord::Migration
  def change
    remove_column :motherboards, :motherboard, :string
  end
end
