class AddProcessorPerformanceIdToProcessorProcessors < ActiveRecord::Migration
  def change
    add_column :processor_processors, :processor_performance_id, :integer
    add_column :processor_processors, :processor_memory_id, :integer
    add_column :processor_processors, :processor_graphic_id, :integer
    add_column :processor_processors, :processor_advanced_technology_id, :integer
    add_column :processor_processors, :processor_data_protection_id, :integer
    add_column :processor_processors, :processor_expansion_id, :integer
    add_column :processor_processors, :processor_package_id, :integer
    add_column :processor_processors, :processor_platform_protection_id, :integer
  end
end
