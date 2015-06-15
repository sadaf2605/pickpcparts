class CreatePowerSupplies < ActiveRecord::Migration
  def change
    create_table :power_supplies do |t|
      t.string :manufacturer
      t.string :part_no
      t.string :type
      t.string :wattage
      t.integer :fans
      t.boolean :modular
      t.string :efficiency_certification
      t.string :efficiency
      t.string :output
      t.string :pci_express_6_plus_2_pin_connectors

      t.timestamps null: false
    end
  end
end
