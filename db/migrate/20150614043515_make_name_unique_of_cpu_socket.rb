class MakeNameUniqueOfCpuSocket < ActiveRecord::Migration
  def change
  	add_index :cpu_sockets, :name, :unique => true
  end
end
