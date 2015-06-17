class CreateProcessorDataProtections < ActiveRecord::Migration
  def change
    create_table :processor_data_protections do |t|
      t.boolean :AES_new_nstructions
      t.boolean :secure_key

      t.timestamps null: false
    end
  end
end
