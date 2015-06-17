class DropProcessorProccessorsTable < ActiveRecord::Migration
  def change
    drop_table :processor_processor_data_protections
    drop_table :processor_processor_expansions
    drop_table :processor_processor_graphics
    drop_table :processor_processor_memories
    drop_table :processor_processor_packages
    drop_table :processor_processor_performances
    drop_table :processor_processor_platform_protections
    drop_table :processor_processors
  end
end
