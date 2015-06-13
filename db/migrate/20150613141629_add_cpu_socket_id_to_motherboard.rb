class AddCpuSocketIdToMotherboard < ActiveRecord::Migration
  def change
    add_column :motherboards, :motherboard, :string
    add_column :motherboards, :cpu_socket_id, :integer
  end
end
