class CreateProcessorMemories < ActiveRecord::Migration
  def change
    create_table :processor_memories do |t|
      t.integer :max_memory_size_GB
      t.integer :max_no_of_memory_channels
      t.float :max_memory_bandwidth_in_GBs
      t.boolean :ecc_memory_supported

      t.timestamps null: false
    end
  end
end
