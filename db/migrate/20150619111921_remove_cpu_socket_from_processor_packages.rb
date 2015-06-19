class RemoveCpuSocketFromProcessorPackages < ActiveRecord::Migration
  def change
    remove_column :processor_packages, :cpu_sockets_id, :integer
  end
end
