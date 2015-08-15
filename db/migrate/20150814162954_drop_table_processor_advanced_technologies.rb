class DropTableProcessorAdvancedTechnologies < ActiveRecord::Migration
  def change
#    drop_table :processor_advanced_technologies
    drop_table :processor_data_protections
    drop_table :processor_expansions
    drop_table :processor_graphics
    drop_table :processor_memories
    drop_table :processor_packages
    drop_table :processor_performances
    drop_table :processor_platform_protections
    drop_table :processor_processor_advanced_options
    drop_table :processor_processors
    drop_table :processors
  end
end
