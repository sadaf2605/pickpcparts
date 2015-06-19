class AddCpuSocketIdAndRemoveCpuSocketsFromProcessorPackages < ActiveRecord::Migration
  def change
    add_column :processor_packages, :cpu_socket, :integer
    remove_column :processor_packages, :cpu_socket
  end
end
