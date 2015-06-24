class RemoveFormFactorFromMotherboards < ActiveRecord::Migration
  def change
    remove_column :motherboards, :form_factor, :string
  end
end
