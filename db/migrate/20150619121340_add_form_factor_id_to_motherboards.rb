class AddFormFactorIdToMotherboards < ActiveRecord::Migration
  def change
    add_column :motherboards, :form_factor_id, :integer
  end
end
