class AddNameToFormFactor < ActiveRecord::Migration
  def change
    add_column :form_factors, :name, :string
    remove_column :form_factors, :string
  end
end
