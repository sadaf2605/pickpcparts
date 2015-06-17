class CreateProcessorPerformances < ActiveRecord::Migration
  def change
    create_table :processor_performances do |t|
      t.integer :no_of_cores
      t.integer :no_of_threads
      t.float :processor_base_frequency_in_GHz
      t.float :thermal_design_power_in_W

      t.timestamps null: false
    end
  end
end
