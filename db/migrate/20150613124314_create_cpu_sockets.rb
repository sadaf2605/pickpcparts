class CreateCpuSockets < ActiveRecord::Migration
  def change
    create_table :cpu_sockets do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
