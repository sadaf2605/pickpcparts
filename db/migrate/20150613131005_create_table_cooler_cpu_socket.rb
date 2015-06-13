class CreateTableCoolerCpuSocket < ActiveRecord::Migration
  def change
    create_table :coolers_cpu_sockets, :id=>false do |t|
      t.integer :cpu_socket_id
      t.integer :cooler_id
    end
  end
end
