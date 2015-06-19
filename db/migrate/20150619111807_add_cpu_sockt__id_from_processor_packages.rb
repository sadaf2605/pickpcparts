class AddCpuSocktIdFromProcessorPackages < ActiveRecord::Migration
  def change
    add_column :processor_packages, :cpu_socket_id, :integer
  end
end
