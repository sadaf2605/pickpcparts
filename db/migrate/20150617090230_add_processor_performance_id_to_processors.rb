class AddProcessorPerformanceIdToProcessors < ActiveRecord::Migration
  def change
    create_table :processors do |t|

    end

    add_column :processors, :processor_performance_id,          :integer
    add_column :processors, :processor_memory_id,               :integer
    add_column :processors, :processor_graphic_id,              :integer
    add_column :processors, :processor_advanced_technology_id,  :integer
    add_column :processors, :processor_data_protection_id,      :integer
    add_column :processors, :processor_expansion_id,            :integer
    add_column :processors, :processor_package_id,              :integer
    add_column :processors, :processor_platform_protection_id,  :integer
  end
end
