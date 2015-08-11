class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :manufacturer
      t.string :part_no

      t.timestamps null: false
    end
  end
end
