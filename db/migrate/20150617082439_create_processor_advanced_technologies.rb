class CreateProcessorAdvancedTechnologies < ActiveRecord::Migration
  def change
    create_table :processor_advanced_technologies do |t|
      t.boolean :turbo_boost_technology
      t.boolean :vPro_technology
      t.boolean :hyper_threading_technology
      t.boolean :virtualization_technology_vtx
      t.boolean :virtualization_technology_for_directed_IO_vtd
      t.boolean :vtx_with_extended_page_tables_ept
      t.boolean :TSX_NI
      t.boolean :intel_64
      t.boolean :idle_states
      t.boolean :enhanced_speedstep_technology
      t.boolean :thermal_monitoring_technologies
      t.boolean :virtualization_technology_for_itanium_vti
      t.boolean :stable_image_platform_program_SIPP

      t.timestamps null: false
    end
  end
end
