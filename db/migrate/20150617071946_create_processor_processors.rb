class CreateProcessorProcessors < ActiveRecord::Migration
  def change
    create_table :processor_processors do |t|
      t.string :processor_number
      t.float :cache_in_MB
      t.float :DMI2_in_GTs
      t.integer :instruction_set_in_bit
      t.string :instruction_set_extensions
      t.boolean :embedded_options_available
      t.float :lithography_in_nm
      t.string :scalability

      t.timestamps null: false
    end
  end
end
