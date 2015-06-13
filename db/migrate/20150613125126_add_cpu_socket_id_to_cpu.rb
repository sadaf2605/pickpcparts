class AddCpuSocketIdToCpu < ActiveRecord::Migration
  def change
    add_column :cpus, :cpu, :string
    add_column :cpus, :cpu_socket_id, :integer
  end
end
