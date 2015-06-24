class CreateFormFactors < ActiveRecord::Migration
  def change
    create_table :form_factors do |t|
      t.string :string
      t.timestamps null: false
    end
  end
end
