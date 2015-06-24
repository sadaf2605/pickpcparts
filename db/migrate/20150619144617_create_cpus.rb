class CreateCpus < ActiveRecord::Migration
  def change
    create_table :cpus do |t|
      t.string :manufacturer
      t.string :model
      t.string :part_no
      t.string :data_width
      t.string :speed
      t.integer :cores
      t.string :l1_cache
      t.string :l2_cache
      t.string :l3_cache
      t.string :lithography
      t.string :thermal_design_power
      t.boolean :includes_cpu_cooler
      t.boolean :hyper_threading
      t.string :integrated_graphics
      t.integer :cpu_socket_id

      t.timestamps null: false
    end
  end
end
