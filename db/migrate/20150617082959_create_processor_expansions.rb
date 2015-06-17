class CreateProcessorExpansions < ActiveRecord::Migration
  def change
    create_table :processor_expansions do |t|
      t.float :PCI_express_revision
      t.integer :max_no_of_PCI_express_lanes

      t.timestamps null: false
    end
  end
end
