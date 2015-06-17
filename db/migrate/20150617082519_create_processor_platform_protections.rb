class CreateProcessorPlatformProtections < ActiveRecord::Migration
  def change
    create_table :processor_platform_protections do |t|
      t.boolean :trusted_execution_technology
      t.boolean :execute_disable_bit

      t.timestamps null: false
    end
  end
end
