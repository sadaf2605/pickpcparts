class AddCpuSocketIdToProcessorPackages < ActiveRecord::Migration
  def change
    add_column :processor_packages, :cpu_sockets_id, :integer
  end
end
