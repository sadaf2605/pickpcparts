class CreateStorages < ActiveRecord::Migration
  def change
    create_table :storages do |t|
      t.string :manufacturer
      t.string :part_no
      t.string :capacity
      t.string :interface
      t.string :cache
      t.string :form_factor
      t.string :ssd_controller
      t.string :nand_flash_type
      t.string :gb_1
      t.string :price_gb

      t.timestamps null: false
    end
  end
end
